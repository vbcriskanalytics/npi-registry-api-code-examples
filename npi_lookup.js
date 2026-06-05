/*
 * NPI Registry API — JavaScript examples (Node 18+, uses global fetch)
 * Docs & free trial: https://restapi.npidataservices.com/
 *
 *   export NPI_API_KEY="your_key_here"
 *   node npi_lookup.js
 */
const API_KEY = process.env.NPI_API_KEY || "YOUR_API_KEY";
const BASE_URL = "https://restapi.npidataservices.com/api/v1";

async function call(path, params) {
  const qs = new URLSearchParams(params).toString();
  const res = await fetch(`${BASE_URL}/${path}?${qs}`, {
    headers: { accept: "application/json", ApiKey: API_KEY },
  });
  if (!res.ok) throw new Error(`HTTP ${res.status}`);
  return res.json();
}

const findByNpi = (npi) => call("findbyNPIId", { NPIId: npi });
const findOrgByName = (orgName, zip) => call("findOrganizationByName", { ORG_NAME: orgName, ZIP_CODE: zip });
const findIndividualByName = (first, last, zip) =>
  call("findIndividualProviderByName", { FIRST_NAME: first, LAST_NAME: last, ZIP_CODE: zip });
const findByTaxonomy = (entityType, taxonomy, zip) =>
  call("findProvidersByTaxonomyCode", { ENTITY_TYPE_CODE: entityType, TAXONOMY_CODE: taxonomy, ZIP_CODE: zip });

(async () => {
  const data = await findByNpi("1053500652");
  const org = data.organization?.[0] || {};
  const tax = data.taxonomy?.[0] || {};
  const loc = data.location?.[0] || {};
  const flags = data.entity_type?.[0] || {};

  console.log("Organization :", org.org_name);
  console.log("Taxonomy     :", tax.taxonomy_desc, `(${tax.taxonomy_code})`);
  console.log("Location     :", loc.addr_city, loc.addr_state);
  console.log("In PECOS     :", flags.in_pecos, "| In LEIE:", flags.in_leie);
})().catch((e) => { console.error(e); process.exit(1); });
