#!/bin/bash
set -e

if [ -z "$GENIEKEY" ]; then
  echo "Missing GENIEKEY, can't continue, exiting."
  exit 1
fi

if [ -z "$TITLE" ]; then
  echo "Missing TITLE, can't continue, exiting."
  exit 1
fi

if [ -z "$DESCRIPTION" ]; then
  DESCRIPTION="this is the description!"
fi

URL="https://api.opsgenie.com/v2/alerts"

curl -X POST "$URL" \
  -H "Content-Type: application/json" \
  -H "Authorization: GenieKey ${GENIEKEY}" \
  -d "{\"message\":\"${TITLE}\",\"description\":\"${DESCRIPTION}\"}"
