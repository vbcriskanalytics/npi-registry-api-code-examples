"""
NPI Registry API — Python examples
Docs & free trial: https://restapi.npidataservices.com/

Setup:
    pip install requests
    export NPI_API_KEY="your_key_here"
    python npi_lookup.py
"""
import os
import requests

API_KEY = os.environ.get("NPI_API_KEY", "YOUR_API_KEY")
BASE_URL = "https://restapi.npidataservices.com/api/v1"
HEADERS = {"accept": "application/json", "ApiKey": API_KEY}


def _get(path, params):
    resp = requests.get(f"{BASE_URL}/{path}", params=params, headers=HEADERS, timeout=15)
    resp.raise_for_status()
    return resp.json()


def find_by_npi(npi):
    """Look up a single provider by 10-digit NPI."""
    return _get("findbyNPIId", {"NPIId": npi})


def find_organization_by_name(org_name, zip_code):
    return _get("findOrganizationByName", {"ORG_NAME": org_name, "ZIP_CODE": zip_code})


def find_individual_by_name(first, last, zip_code):
    return _get("findIndividualProviderByName",
                {"FIRST_NAME": first, "LAST_NAME": last, "ZIP_CODE": zip_code})


def find_by_taxonomy(entity_type_code, taxonomy_code, zip_code):
    return _get("findProvidersByTaxonomyCode",
                {"ENTITY_TYPE_CODE": entity_type_code, "TAXONOMY_CODE": taxonomy_code, "ZIP_CODE": zip_code})


if __name__ == "__main__":
    data = find_by_npi("1053500652")
    org = (data.get("organization") or [{}])[0]
    tax = (data.get("taxonomy") or [{}])[0]
    loc = (data.get("location") or [{}])[0]
    flags = (data.get("entity_type") or [{}])[0]

    print("Organization :", org.get("org_name"))
    print("Taxonomy     :", tax.get("taxonomy_desc"), f"({tax.get('taxonomy_code')})")
    print("Location     :", loc.get("addr_city"), loc.get("addr_state"))
    print("In PECOS     :", flags.get("in_pecos"), "| In LEIE:", flags.get("in_leie"))
