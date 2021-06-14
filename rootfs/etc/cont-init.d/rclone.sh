#! /usr/bin/with-contenv bashio

bashio::log.info "Configuring rclone..."

bashio::config.require.username 'credentials.username'
bashio::config.require.password 'credentials.password'

bashio::config.suggest.true 'tls.ssl'
bashio::config.require.ssl 'tls' 'tls.certfile' 'tls.keyfile'

sync_command=$(bashio::config 'sync_command')
destination=$(bashio::config 'destination')

username=$(bashio::config 'credentials.username')
password=$(bashio::config 'credentials.password')

command="rclone rc --user \"$username\" --pass \"$password\" sync/$sync_command srcFs=/backup dstFs=$destination _async=true"

echo "$(bashio::config 'cron') $command" > /etc/crontabs/root
crontab -l
