#!/usr/bin/env bash

# Load configuration
source nc-ddns.config.sh

# Lookup my IP
MY_IP=$(curl -fsSL "icanhazip.com")
if [ $? -ne 0 ]; then
    echo "*** IP lookup failed. Is the IP lookup service offline?"
    exit 1
fi

# Formulate URL to update my IP in Namecheap, based on documentation:
# https://www.namecheap.com/support/knowledgebase/article.aspx/29/11/how-do-i-use-a-browser-to-dynamically-update-the-hosts-ip/
UPDATE_URL="https://dynamicdns.park-your-domain.com/update?host=${NC_DDNS_HOST}&domain=${NC_DDNS_DOMAIN}&password=${NC_DDNS_PASSWORD}&ip=${MY_IP}"

# Update my IP in Namecheap
STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" "${UPDATE_URL}")
if [ $STATUS_CODE -ne 200 ]; then
    echo "*** Update IP failed. Is the configuration wrong?"
    exit 1
fi
