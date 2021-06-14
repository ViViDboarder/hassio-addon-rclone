# rclone

## Configuration

|field|description|
|---|---|
|`cron`|Cron schedule to run the sync job|
|`destination`|The rclone destination in the form `<drive>:<path>`|
|`sync_command`|Rclone command to execute (`sync`, `copy`, or `move`)|
|`credentials.username`|Username to view web UI|
|`credentials.password`|Password to view web UI|
|`tls.ssl`|Enable TLS. Recommended if not using ingress|
|`tls.certfile`|TLS cert file to use|
|`tls.keyfile`|TLS key file to use|

