#!/data/data/com.termux/files/usr/bin/bash

echo "▶️ Iniciando servidor Flask..."
python server.py &

# Espera unos segundos para que Flask arranque
sleep 5

echo "🌐 Abriendo túnel con Cloudflared..."
cloudflared tunnel --url http://localhost:5000 &

# Espera unos segundos para que Cloudflared genere la URL
sleep 5

echo "👀 Monitoreando intentos en logs/access.log..."
tail -f logs/access.log