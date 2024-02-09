#! /usr/bin/with-contenv bashio

set +x
set -eo pipefail

bashio::log.info "Running timegaps..."

TIMEGAPS_RULES=$(bashio::config 'prune.rules')
TIMEGAPS_DELETE=""
if bashio::config.true 'prune.delete'; then
    TIMEGAPS_DELETE="--delete"
fi

if bashio::config.true 'protected_only'; then
    find /backup -name "*.tar" -exec tar -xOf "{}" ./backup.json \; \
        | jq -r 'select(.protected) | "/backup/\(.slug).tar"' \
        | timegaps --stdin $TIMEGAPS_DELETE "$TIMEGAPS_RULES"
else
    timegaps $TIMEGAPS_DELETE "$TIMEGAPS_RULES"
fi

