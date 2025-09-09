// .github/scripts/fetch_and_convert.mjs
import fs from "node:fs/promises";
import Cite from "citation-js";

const { API_KEY, GROUP_ID, COLL_KEY } = process.env;

async function fetchPage(start, limit) {
  const url = `https://api.zotero.org/groups/${GROUP_ID}/collections/${COLL_KEY}/items?format=csljson&recursive=1&top=1&limit=${limit}&start=${start}`;
  const res = await fetch(url, {
    headers: {
      "Zotero-API-Version": "3",
      "Authorization": `Bearer ${API_KEY}`
    }
  });
  if (!res.ok) throw new Error(`HTTP ${res.status} fetching ${url}`);
  const items = await res.json();
  const total = parseInt(res.headers.get("Total-Results") || `${items.length}`, 10);
  return { items, total };
}

async function fetchAll() {
  const limit = 100;
  let start = 0, all = [];
  for (;;) {
    const { items, total } = await fetchPage(start, limit);
    all = all.concat(items);
    if (items.length < limit || all.length >= total) break;
    start += items.length;
  }
  return all;
}

// Extract pinned Better BibTeX key from Zotero Extra field (CSL note)
function pinnedKeyFromNote(note) {
  if (!note) return null;
  const m = note.match(/^\s*Citation Key:\s*([^\s#]+)\s*$/mi);
  return m ? m[1] : null;
}

const items = await fetchAll();
const pinned = new Map();
for (const it of items) {
  const key = pinnedKeyFromNote(it.note);
  if (key) pinned.set(it.id, key);
}

const cite = new Cite(items);
let bib = cite.format("bibtex", { format: "text" });

// Replace keys with pinned ones where present
bib = bib.replace(/@(\w+)\{([^,]+),/g, (m, type, k) => {
  const newKey = pinned.get(k) || k;
  return `@${type}{${newKey},`;
});

await fs.mkdir("extra", { recursive: true });
await fs.writeFile("extra/references.bib", bib, "utf8");

console.log(`Wrote extra/references.bib with ${items.length} records (pinned: ${pinned.size})`);
