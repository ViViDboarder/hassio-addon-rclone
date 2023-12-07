#! /usr/bin/with-contenv bashio

bashio::log.info "Running rclone..."

SYNC_COMMAND=$(bashio::config 'sync_command')
DESTINATION=$(bashio::config 'destination')

set +x

FILTER='{"IncludeRule": ["*.tar"]}'
if bashio::config.true 'protected_only'; then
    FILTER="{\"IncludeRule\": $(find /backup -name "*.tar" -exec tar -xOf "{}" ./backup.json \;| jq -sc 'map(select(.protected) | "/backup/\(.slug).tar")')}"
fi

bashio::log.info "Filter: $FILTER"


# Maybe add the username and password
if bashio::config.has_value 'credentials.username' && bashio::config.has_value 'credentials.password'; then
  rclone_flags+=("--rc-user" "$(bashio::config 'credentials.username')")
  rclone_flags+=("--rc-pass" "$(bashio::config 'credentials.password')")
fi

rclone rc "${rclone_flags[@]}" "sync/$SYNC_COMMAND" srcFs=/backup "dstFs=$DESTINATION" _async=true _filter="$FILTER"
