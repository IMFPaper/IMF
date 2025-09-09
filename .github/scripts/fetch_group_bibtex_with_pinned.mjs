// Fetch CSL-JSON parents from a Zotero group collection, read pinned keys from
// "Extra" (CSL 'note'), fetch server BibTeX for the same items, and rewrite keys.
// Writes extra/references.bib

import fs from "node:fs/promises";

const { API_KEY, GROUP_ID, COLL_KEY } = process.env;
if (!API_KEY || !GROUP_ID || !COLL_KEY) {
  console.error("Missing API_KEY / GROUP_ID / COLL_KEY");
  process.exit(1);
}

async function fetchJSON(url) {
  const res = await fetch(url, {
    headers: {
      "Zotero-API-Version": "3",
      "Authorization": `Bearer ${API_KEY}`,
      "Accept": "application/json"
    }
  });
  if (!res.ok) throw new Error(`HTTP ${res.status} for ${url}`);
  const body = await res.json();
  const headers = res.headers;
  return { body, headers };
}

async function fetchText(url) {
  const res = await fetch(url, {
    headers: {
      "Zotero-API-Version": "3",
      "Authorization": `Bearer ${API_KEY}`
    }
  });
  if (!res.ok) throw new Error(`HTTP ${res.status} for ${url}`);
  const body = await res.text();
  const headers = res.headers;
  return { body, headers };
}

// Some endpoints return an array; others wrap as { items: [...] }.
// Normalize to an array of items.
function normalizeItems(json) {
  if (Array.isArray(json)) return json;
  if (json && Array.isArray(json.items)) return json.items;
  return [];
}

// Parse pinned key from Zotero Extra (CSL field 'note').
function pinnedFromNote(note) {
  if (!note) return null;
  const m = note.match(/^\s*Citation Key:\s*([^\s#]+)\s*$/mi);
  return m ? m[1] : null;
}

async function fetchAllParentsCSL() {
  const base = `https://api.zotero.org/groups/${GROUP_ID}/collections/${COLL_KEY}/items`;
  const params = `?format=csljson&recursive=1&top=1&limit=100&start=`;
  let start = 0, all = [];
  for (;;) {
    const url = `${base}${params}${start}`;
    const { body, headers } = await fetchJSON(url);
    const page = normalizeItems(body);
    const total = parseInt(headers.get("Total-Results") || `${page.length}`, 10);
    console.log(`Fetched ${page.length} items (start=${start}, total≈${total})`);
    all = all.concat(page);
    if (page.length < 100 || all.length >= total) break;
    start += page.length;
  }
  return all;
}

const cslItems = await fetchAllParentsCSL();

const pinnedMap = new Map();
const itemKeys = [];
for (const it of cslItems) {
  // CSL id format is "<libraryId>/<itemKey>"
  const id = typeof it.id === "string" ? it.id : "";
  const key = id.split("/").pop();
  if (!key) continue;
  itemKeys.push(key);
  const pinned = pinnedFromNote(it.note);
  if (pinned) pinnedMap.set(key, pinned);
}

if (itemKeys.length === 0) {
  console.warn("No parent items found. Check API key group permissions and the collection key.");
}

// Fetch BibTeX for item keys (server translators). Chunk to avoid URL bloat.
async function fetchBibForKeys(keys) {
  const joined = keys.join(",");
  const url = `https://api.zotero.org/groups/${GROUP_ID}/items?format=bibtex&itemKey=${joined}`;
  const { body } = await fetchText(url);
  return body;
}

let bib = "";
for (let i = 0; i < itemKeys.length; i += 50) {
  const chunk = itemKeys.slice(i, i + 50);
  const part = await fetchBibForKeys(chunk);
  if (part && part.trim()) {
    if (bib && !bib.endsWith("\n")) bib += "\n";
    bib += part.trim() + "\n";
  }
}

// Rewrite entry keys to pinned ones where present.
// Server BibTeX uses the 8-char Zotero itemKey by default.
bib = bib.replace(/@(\w+)\{([^,]+),/g, (m, type, k) => {
  const newKey = pinnedMap.get(k) || k;
  return `@${type}{${newKey},`;
});

await fs.mkdir("extra", { recursive: true });
await fs.writeFile("extra/references.bib", bib, "utf8");

console.log(`Wrote extra/references.bib with ${itemKeys.length} entries (pinned: ${pinnedMap.size})`);
