#! /usr/bin/with-contenv bashio

bashio::log.info "Configuring rclone..."

if bashio::config.true 'tls.ssl'; then
  bashio::config.require.ssl 'tls' 'tls.certfile' 'tls.keyfile'
else
  bashio::log.warning
  bashio::log.warning "It's recommended to set tsl settings if exposing to the network and not through the proxy."
  bashio::log.warning
fi

if ! bashio::config.has_value 'credentials.username' || ! bashio::config.has_value 'credentials.password'; then
  bashio::log.warning
  bashio::log.warning "It's recommended to set credentials.username and credentials.password settings if exposing to the network and not through the proxy."
  bashio::log.warning
fi

echo "$(bashio::config 'cron') /run_rclone.sh" >> /etc/crontabs/root
crontab -l
