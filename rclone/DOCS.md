# Rclone Snapshot Sync

[Rclone](https://rclone.org) is an open-source tool for syncing data between a wide range of remote tarets.

This addon allows you to sync backup snapshots to a different device using rclone

## Configuring a drive

Before you can set up your destionation, you'll need to configure a "drive" in rsync. This can be done by embedding values in the `destination` field in your config (eg. `destination: ":ftp,host=<myhost>,user=<myuser>,pass=<mypass>:/path/on/server"`, or via the web UI accessible once the plugin is running.

### An important note on passwords...
Rclone expects passwords to be obscured. When you provide your password in either method (inline in destination or through the web UI), you must provide an obscured password.

To obscure your password, you'll need to [install `rclone`](https://rclone.org/install/) on one of your computers and then follow [the instructions in the rclone documentation](https://rclone.org/commands/rclone_obscure/)

## Configuration

### Option: `cron`

Cron schedule to run the sync job. Need help? https://crontab.guru/

### Option: `destination`

The rclone destination in the form `<drive>:<path>`. See note above on how to set up a drive.

### Option: `sync_command`

Rclone command to execute (`sync`, `copy`, or `move`)

### Option: `prune.rules`

Rules for pruning backups based on time gap configuration. This is done with a tool caled [timegaps](https://gehrcke.de/timegaps/) and is optional.

### Option: `prune.cron`

Cron schedule to run the prune job. Need help? https://crontab.guru/

### Option: `prune.delete`

Rather than logging, if set to true, this will delete backups based on the rules set in `prune.rules`.

### Option: `credentials.username`

Username to view web UI

### Option: `credentials.password`

Password to view web UI

### Option: `tls.ssl`

Enable TLS. Recommended if not using ingress

### Option: `tls.certfile`

TLS cert file to use when ssl is enabled

### Option: `tls.keyfile`

TLS key file to use when ssl is enabled

### Option: `protected_only`

Only include protected backups. This avoids syncing an unencrypted backup to a destination.
