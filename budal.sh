#!/bin/bash
# Ambil IP publik
WORKER_NAME=$(curl -s ifconfig.me)
# Menjalankan miner di dalam screen session
screen -dmS Miner ./xmrig -a randomx -o hk.salvium.herominers.com:1230 -u SaLvs8a4bBSWZMHSLpMEJv8pN9hNu7invJcptk3g4qQ2A6RSiudHRTcXs6R9KP6iwjj3qQakN7qVw7nox18NyqvULsvRkFNGX7q -p $WORKER_NAME --cpu-priority 5 --randomx-1gb-pages --no-msr
