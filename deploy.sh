#!/usr/bin/env bash
# Publish the app and update it on Zone.ee (PM2 process "sugupuu").
set -euo pipefail

HOST="virt140715@maksimtsikvasvili24.thkit.ee"
KEY="$HOME/.ssh/zone_ee"
REMOTE_DIR="sugupuu-app"
OUT="bin/deploy"

cd "$(dirname "$0")"

rm -rf "$OUT"
dotnet publish -c Release -r linux-x64 --self-contained true -o "$OUT"

# --delete removes files that no longer exist locally; pm2.json lives only on the server.
rsync -az --delete --exclude pm2.json -e "ssh -i $KEY" "$OUT/" "$HOST:$REMOTE_DIR/"

ssh -i "$KEY" "$HOST" "chmod +x $REMOTE_DIR/sugupuuRakendusXML && pm2 restart sugupuu && pm2 save"
