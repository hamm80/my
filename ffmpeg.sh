#! /bin/bash

wget https://raw.githubusercontent.com/hamm80/my/refs/heads/main/logo.png

RTMP_URL="rtmps://live-api-s.facebook.com:443/rtmp/"
read -p "YOUR KEY: " CRP
RTMP_KEY="$CRP"
read -p "YOUR SOURCE: " CRP
VIDEO_SOURCE="$CRP"



ffmpeg -re -i "$VIDEO_SOURCE" -re -i logo.png  -filter_complex "[1:v]scale=60:60[logo];[0:v][logo]overlay=W-w-20:H-h-20" -c:v libx264 -b:v 3000k -preset veryfast -maxrate 3000k -bufsize 6000k -c:a aac -b:a 128k -f flv $RTMP_URL/$RTMP_KEY 
