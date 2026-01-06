#!/bin/sh
set -e

WATCH_FILE="/etc/letsencrypt/.reload_nginx"

(
    while true; do
        if [ -f "$WATCH_FILE" ]; then
            echo "Reload triggered (requested by certbot)"
            rm -f "$WATCH_FILE"
            nginx -s reload
        fi
        sleep 1h
    done
) &
