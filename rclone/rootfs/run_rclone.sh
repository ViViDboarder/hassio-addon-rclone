#! /usr/bin/with-contenv bashio

bashio::log.info "Running rclone..."

SYNC_COMMAND=$(bashio::config 'sync_command')
DESTINATION=$(bashio::config 'destination')

USERNAME=$(bashio::config 'credentials.username')
PASSWORD=$(bashio::config 'credentials.password')

set +x

FILTER='{"IncludeRule": ["*.tar"]}'
if bashio::config.true 'protected_only'; then
    FILTER="{\"IncludeRule\": $(find /backup -name "*.tar" -exec tar -xOf "{}" ./backup.json \;| jq -sc 'map(select(.protected) | "/backup/\(.slug).tar")')}"
fi

rclone rc --user "$USERNAME" --pass "$PASSWORD" "sync/$SYNC_COMMAND" srcFs=/backup "dstFs=$DESTINATION" _async=true _filter="$FILTER"
