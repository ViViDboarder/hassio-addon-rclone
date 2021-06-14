#! /usr/bin/with-contenv bashio

bashio::log.info "Configuring rclone..."

sync_command=$(bashio::config 'sync_command')
destination=$(bashio::config 'destination')

username=$(bashio::config 'credentials.username')
password=$(bashio::config 'credentials.password')

command="rclone rc --user \"$username\" --pass \"$password\" sync/$sync_command srcFs=/backup dstFs=$destination _async=true"

echo "$(bashio::config 'cron') $command" > /etc/crontabs/root
crontab -l
