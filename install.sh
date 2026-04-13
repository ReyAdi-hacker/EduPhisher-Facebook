#!/data/data/com.termux/files/usr/bin/bash

echo "🔧 Actualizando paquetes..."
pkg update -y && pkg upgrade -y

echo "📦 Instalando dependencias básicas..."
pkg install -y python git wget tmux docker

echo "🐍 Instalando Flask..."
pip install flask

echo "🌐 Descargando Cloudflared..."
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm -O cloudflared
chmod +x cloudflared
mv cloudflared $PREFIX/bin/

echo "✅ Verificando instalaciones..."
python --version
pip --version
pip show flask | grep Version
wget --version
tmux -V
cloudflared --version
docker --version

echo "🎉 Instalación completa. Ya puedes correr tu simulador."