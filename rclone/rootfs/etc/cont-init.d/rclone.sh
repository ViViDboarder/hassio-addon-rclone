#! /usr/bin/with-contenv bashio

bashio::log.info "Configuring rclone..."

bashio::config.require.username 'credentials.username'
bashio::config.require.password 'credentials.password'

bashio::config.suggest.true 'tls.ssl'
bashio::config.require.ssl 'tls' 'tls.certfile' 'tls.keyfile'

echo "$(bashio::config 'cron') /run_rclone.sh" >> /etc/crontabs/root
crontab -l
