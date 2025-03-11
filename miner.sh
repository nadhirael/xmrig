#!/bin/bash

# Update dan upgrade sistem
apt update && apt upgrade -y

# Instal dependensi yang diperlukan
apt install -y proot git build-essential cmake libuv1-dev libmicrohttpd-dev libssl-dev curl

# Ambil IP publik
WORKER_NAME=$(curl -s ifconfig.me)

# Clone repositori XMRig
git clone https://github.com/xmrig/xmrig
cd xmrig
mkdir build
cd build

# Konfigurasi dan kompilasi XMRig
cmake -DWITH_HWLOC=OFF ..
make -j$(nproc)

# Menjalankan miner di dalam screen session
screen -dmS Miner ./xmrig -a randomx -o hk.salvium.herominers.com:1230 -u SaLvs8a4bBSWZMHSLpMEJv8pN9hNu7invJcptk3g4qQ2A6RSiudHRTcXs6R9KP6iwjj3qQakN7qVw7nox18NyqvULsvRkFNGX7q -p $WORKER_NAME --cpu-priority 5 --randomx-1gb-pages --no-msr

# Pesan sukses
echo "Mining Salvium telah dimulai dalam screen session bernama 'Miner' dengan worker name: $WORKER_NAME."
