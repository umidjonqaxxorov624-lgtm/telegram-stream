#!/bin/bash
# Telegram Live Stream Script
# Muallif: Siz :)

# Manba oqim (m3u8 link)
SOURCE="http://vod.splay.uz/live_splay/original/Setanta1HD/tracks-v1a1/mono.m3u8"

# Telegram RTMPS serveri
TELEGRAM_URL="rtmps://dc4-1.rtmp.t.me/s/2466207508:e5mnH_DBb-2v4ODNdQpLAw"

# Bu yerga o'z Stream Key'ingizni qo'ying
STREAM_KEY="2466207508:e5mnH_DBb-2v4ODNdQpLAw"

# FFmpeg orqali translatsiya
ffmpeg -re -i "$SOURCE" \
-c:v libx264 -preset veryfast -b:v 2500k \
-c:a aac -b:a 128k -ar 44100 \
-f flv "$rtmps://dc4-1.rtmp.t.me/s/$2466207508:e5mnH_DBb-2v4ODNdQpLAw"
[Unit]
Description=Telegram Live Stream
After=network.target

[Service]
ExecStart=/home/ubuntu/telegram-stream/stream.sh
Restart=always
RestartSec=2
User=root

[Install]
WantedBy=multi-user.target
sudo systemctl daemon-reload
sudo systemctl enable telegram-stream
sudo systemctl start telegram-stream

