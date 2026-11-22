#!/data/data/com.termux/files/usr/bin/bash
cd "$(dirname "$0")" || exit 1
PORT="${1:-8000}"
IP="$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="src"){print $(i+1); exit}}')"
if [ -z "$IP" ]; then IP="$(hostname -I 2>/dev/null | awk '{print $1}')"; fi
if [ -z "$IP" ]; then IP="PHONE-LAN-IP"; fi
printf '\nNEXORA LAN SERVER\nOpen this address on another device connected to the same Wi-Fi:\nhttp://%s:%s\n\nPress Ctrl+C to stop the server.\n\n' "$IP" "$PORT"
exec python -m http.server "$PORT" --bind 0.0.0.0
