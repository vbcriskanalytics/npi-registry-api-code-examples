# NPI Registry API — code examples

Runnable examples (cURL, Python, JavaScript) for the
**[NPI Registry API](“https://restapi.npidataservices.com/nppes-api-vs-npi-registry-api")** — real-time NPI lookup and provider
search over NPPES data (taxonomy, practice locations, Medicare enrollment, PECOS & LEIE).

- **Docs / free trial:** https://restapi.npidataservices.com/#docs
- **Base URL:** `https://restapi.npidataservices.com/api/v1`
- **Auth:** send your key in an `ApiKey` request header
- **NPPES API vs. NPI Registry API:** https://restapi.npidataservices.com/nppes-api-vs-npi-registry-api

## Get a key
Sign up for a free trial at [restapi.npidataservices.com](https://restapi.npidataservices.com/) and
your API key arrives by email. Then export it:

```bash
export NPI_API_KEY="your_key_here"
```

## Endpoints
| Endpoint | Find providers by | Example |
|---|---|---|
| `GET /findbyNPIId` | NPI | `?NPIId=1053500652` |
| `GET /findbyPACId` | PECOS PAC ID | `?PAC_ID=4284711805` |
| `GET /findbyPACENRLId` | PECOS enrollment ID | `?ENRLMT_ID=I20171103000690` |
| `GET /findOrganizationByName` | org name + ZIP | `?ORG_NAME=BAK&ZIP_CODE=45140` |
| `GET /findIndividualProviderByName` | name + ZIP | `?FIRST_NAME=JOS&LAST_NAME=THR&ZIP_CODE=34292` |
| `GET /findProvidersByTaxonomyCode` | entity type + taxonomy + ZIP | `?ENTITY_TYPE_CODE=2&TAXONOMY_CODE=2085R0202X&ZIP_CODE=31520` |
| `GET /findProviderByName` | org/last/first name + state | `?LAST_NAME=SMITH&FIRST_NAME=JOHN&STATE=CA` |

## Run the examples
- **cURL:** `bash curl/examples.sh`
- **Python:** `pip install requests && python python/npi_lookup.py`
- **JavaScript (Node 18+):** `node javascript/npi_lookup.js`

## License
MIT

## Disclaimer
The NPI Registry API is an independent commercial service, **not affiliated with or endorsed by** CMS, NPPES, or any U.S. government agency. Data comes from public NPPES/CMS sources and is provided **"as is," without warranty** — verify critical results against the official [NPPES NPI Registry](https://npiregistry.cms.hhs.gov/) before relying on them. Nothing here is legal, medical, or billing advice.

## Disclosure
This repository is maintained by **VBC Risk Analytics**, operator of the commercial NPI Registry API at [restapi.npidataservices.com](https://restapi.npidataservices.com/). The examples promote our own paid service (free trial available).
