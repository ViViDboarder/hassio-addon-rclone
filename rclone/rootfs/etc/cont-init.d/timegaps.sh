#! /usr/bin/with-contenv bashio

bashio::log.info "Configuring pruning with timegaps..."
TIMEGAPS_RULES=$(bashio::config 'prune.rules')
TIMEGAPS_CRON=$(bashio::config 'prune.cron')
TIMEGAPS_DELETE=""
if bashio::config.true 'prune.delete'; then
    TIMEGAPS_DELETE="--delete"
fi

if [ -n "$TIMEGAPS_RULES" ] && [ -n "$TIMEGAPS_CRON" ]; then
    COMMAND="timegaps $TIMEGAPS_DELETE $TIMEGAPS_RULES /backups/*.tar"

    echo "$TIMEGAPS_CRON $COMMAND" >> /etc/crontabs/root
    crontab -l
fi
