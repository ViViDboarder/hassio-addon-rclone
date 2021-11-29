#! /usr/bin/with-contenv bashio

bashio::log.info "Configuring rclone..."

bashio::config.require.username 'credentials.username'
bashio::config.require.password 'credentials.password'

bashio::config.suggest.true 'tls.ssl'
bashio::config.require.ssl 'tls' 'tls.certfile' 'tls.keyfile'

SYNC_COMMAND=$(bashio::config 'sync_command')
DESTINATION=$(bashio::config 'destination')

USERNAME=$(bashio::config 'credentials.username')
PASSWORD=$(bashio::config 'credentials.password')

command="rclone rc --user \"$USERNAME\" --pass \"$PASSWORD\" sync/$SYNC_COMMAND srcFs=/backup dstFs=$DESTINATION _async=true"

echo "$(bashio::config 'cron') $command" >> /etc/crontabs/root
crontab -l
