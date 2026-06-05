#!/usr/bin/env bash
# NPI Registry API — cURL examples
# Docs & free trial: https://restapi.npidataservices.com/
#
#   export NPI_API_KEY="your_key_here"
#   bash examples.sh
set -euo pipefail

BASE="https://restapi.npidataservices.com/api/v1"
KEY="${NPI_API_KEY:-YOUR_API_KEY}"
H_ACCEPT="accept: application/json"
H_KEY="ApiKey: ${KEY}"

echo "# Find by NPI"
curl -s -X GET "${BASE}/findbyNPIId?NPIId=1053500652" -H "$H_ACCEPT" -H "$H_KEY"; echo

echo "# Find by PECOS PAC ID"
curl -s -X GET "${BASE}/findbyPACId?PAC_ID=4284711805" -H "$H_ACCEPT" -H "$H_KEY"; echo

echo "# Find by PECOS enrollment ID"
curl -s -X GET "${BASE}/findbyPACENRLId?ENRLMT_ID=I20171103000690" -H "$H_ACCEPT" -H "$H_KEY"; echo

echo "# Find organization by name + ZIP"
curl -s -X GET "${BASE}/findOrganizationByName?ORG_NAME=BAK&ZIP_CODE=45140" -H "$H_ACCEPT" -H "$H_KEY"; echo

echo "# Find individual provider by name + ZIP"
curl -s -X GET "${BASE}/findIndividualProviderByName?FIRST_NAME=JOS&LAST_NAME=THR&ZIP_CODE=34292" -H "$H_ACCEPT" -H "$H_KEY"; echo

echo "# Find providers by taxonomy code"
curl -s -X GET "${BASE}/findProvidersByTaxonomyCode?ENTITY_TYPE_CODE=2&TAXONOMY_CODE=2085R0202X&ZIP_CODE=31520" -H "$H_ACCEPT" -H "$H_KEY"; echo

echo "# Find provider by name / state"
curl -s -X GET "${BASE}/findProviderByName?LAST_NAME=SMITH&FIRST_NAME=JOHN&STATE=CA" -H "$H_ACCEPT" -H "$H_KEY"; echo
