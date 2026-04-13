#!/bin/bash
echo "Iniciando servidor Flask..."
python3 server.py &

sleep 5

echo "Abriendo túnel con Cloudflared..."
URL=$(cloudflared tunnel --no-tls-verify --url http://localhost:5000 --loglevel debug | grep -i "trycloudflare.com" | awk '{print $NF}')

echo ""
echo "==============================================="
echo "   ENLACE PÚBLICO: $URL"
echo "==============================================="
echo ""

echo "==============================================="
echo "   INTENTOS EN VIVO (logs/access.log)"
echo "   También se guardan en intentos.txt"
echo "==============================================="
# Mostrar en vivo y guardar en intentos.txt
tail -f logs/access.log | tee -a intentos.txt