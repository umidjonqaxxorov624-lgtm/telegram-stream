# Telegram Live Stream Script

Bu loyiha **Ubuntu serverda (VPS)** ishlaydigan oddiy skript bo‘lib, 
m3u8 oqimini **Telegram Live Stream** (RTMPS) orqali uzatadi.

---

## O‘rnatish
Serverga `git` o‘rnating va reponi yuklab oling:

```bash
sudo apt update && sudo apt install -y git ffmpeg
git clone https://github.com/USERNAME/telegram-stream.git
cd telegram-stream
```

---

## Ishga tushirish
```bash
chmod +x stream.sh
./stream.sh
```

---

## Avtomatik ishga tushirish (systemd orqali)
`/etc/systemd/system/telegram-stream.service` fayl yarating:

```ini
[Unit]
Description=Telegram Live Stream
After=network.target

[Service]
ExecStart=/home/ubuntu/telegram-stream/stream.sh
Restart=always
RestartSec=5
User=root

[Install]
WantedBy=multi-user.target
```

So‘ng:

```bash
sudo systemctl daemon-reload
sudo systemctl enable telegram-stream
sudo systemctl start telegram-stream
```

Holatini tekshirish:
```bash
sudo systemctl status telegram-stream
```

---

## Eslatma
- `stream.sh` faylida **YOUR_STREAM_KEY_HERE** joyiga o‘z Telegram stream keyingizni yozishni unutmang.
- Manba oqim sifatida boshqa `.m3u8` linklardan ham foydalanishingiz mumkin.
