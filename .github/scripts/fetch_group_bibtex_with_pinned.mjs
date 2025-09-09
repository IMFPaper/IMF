// Fetches CSL-JSON for a group collection (parents only) to read pinned keys,
// then fetches server-side BibTeX for the same items and rewrites entry keys
// to the pinned keys when present. Writes extra/references.bib.

import fs from "node:fs/promises";

const { API_KEY, GROUP_ID, COLL_KEY } = process.env;
if (!API_KEY || !GROUP_ID || !COLL_KEY) {
  console.error("Missing API_KEY / GROUP_ID / COLL_KEY");
  process.exit(1);
}

// ---- helpers ----
async function fetchJSON(url) {
  const res = await fetch(url, {
    headers: {
      "Zotero-API-Version": "3",
      "Authorization": `Bearer ${API_KEY}`
    }
  });
  if (!res.ok) throw new Error(`HTTP ${res.status} for ${url}`);
  return { body: await res.json(), headers: res.headers };
}

async function fetchText(url) {
  const res = await fetch(url, {
    headers: {
      "Zotero-API-Version": "3",
      "Authorization": `Bearer ${API_KEY}`
    }
  });
  if (!res.ok) throw new Error(`HTTP ${res.status} for ${url}`);
  return { body: await res.text(), headers: res.headers };
}

// Parse pinned key from Zotero Extra (CSL-JSON exposes it in 'note')
function pinnedFromNote(note) {
  if (!note) return null;
  const m = note.match(/^\s*Citation Key:\s*([^\s#]+)\s*$/mi);
  return m ? m[1] : null;
}

// ---- 1) Get all parent items from the collection (CSL-JSON) ----
async function fetchAllParentsCSL() {
  const base = `https://api.zotero.org/groups/${GROUP_ID}/collections/${COLL_KEY}/items`;
  const params = `?format=csljson&recursive=1&top=1&limit=100&start=`;
  let start = 0, all = [];
  for (;;) {
    const { body, headers } = await fetchJSON(`${base}${params}${start}`);
    const total = parseInt(headers.get("Total-Results") || `${body.length}`, 10);
    all = all.concat(body);
    if (body.length < 100 || all.length >= total) break;
    start += body.length;
  }
  return all;
}

const cslItems = await fetchAllParentsCSL();

// Build map: itemKey -> pinnedKey
// cslItem.id looks like "<libraryId>/<itemKey>"
const pinnedMap = new Map();
const itemKeys = [];
for (const it of cslItems) {
  const key = (it.id || "").split("/").pop();
  if (!key) continue;
  itemKeys.push(key);
  const pinned = pinnedFromNote(it.note);
  if (pinned) pinnedMap.set(key, pinned);
}

// ---- 2) Fetch BibTeX for those items in chunks ----
// Zotero API accepts itemKey=K1,K2,...; keep chunks small (e.g. 50).
async function fetchBibForKeys(keys) {
  const joined = keys.join(",");
  const url = `https://api.zotero.org/groups/${GROUP_ID}/items?format=bibtex&itemKey=${joined}`;
  const { body } = await fetchText(url);
  return body;
}

const chunks = [];
for (let i = 0; i < itemKeys.length; i += 50) chunks.push(itemKeys.slice(i, i + 50));

let bib = "";
for (const ch of chunks) {
  const part = await fetchBibForKeys(ch);
  if (part && part.trim()) {
    // Ensure output is separated cleanly
    if (bib && !bib.endsWith("\n")) bib += "\n";
    bib += part.trim() + "\n";
  }
}

// ---- 3) Rewrite entry keys using pinnedMap ----
// Server BibTeX uses the Zotero item key (the 8-char code) as the entry key.
// Replace "@type{ASBGC6XH," with the pinned "@type{dyson2010," etc.
bib = bib.replace(/@(\w+)\{([^,]+),/g, (m, type, k) => {
  const newKey = pinnedMap.get(k) || k;
  return `@${type}{${newKey},`;
});

// ---- 4) Write output ----
await fs.mkdir("extra", { recursive: true });
await fs.writeFile("extra/references.bib", bib, "utf8");

console.log(`Wrote extra/references.bib with ${itemKeys.length} entries (pinned: ${pinnedMap.size})`);
