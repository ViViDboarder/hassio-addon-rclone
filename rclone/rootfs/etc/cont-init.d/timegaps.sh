#! /usr/bin/with-contenv bashio

TIMEGAPS_RULES=$(bashio::config 'prune.rules')
TIMEGAPS_CRON=$(bashio::config 'prune.cron')

if [ -n "$TIMEGAPS_RULES" ] && [ -n "$TIMEGAPS_CRON" ]; then
    bashio::log.info "Configuring pruning with timegaps..."
    echo "$TIMEGAPS_CRON /run_timegaps.sh" >> /etc/crontabs/root
    crontab -l
fi
