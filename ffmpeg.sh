#! /bin/bash

VBR="1500k"
FPS="20"
QUAL="veryfast"
RTMP_URL="rtmps://live-api-s.facebook.com:443/rtmp/"
read -p "YOUR KEY: " CRP
RTMP_KEY="$CRP"
read -p "YOUR SOURCE: " CRP
VIDEO_SOURCE="$CRP"

while true; do

ffmpeg -re -i "$VIDEO_SOURCE" -re -i logo.png  -filter_complex "[1:v]scale=60:60[logo];[0:v][logo]overlay=W-w-50:H-h-900" -c:v libx264 -b:v 2000k -preset veryfast -maxrate 3000k -bufsize 6000k -c:a aac -b:a 128k -f flv $RTMP_URL/$RTMP_KEY 

echo "البث الأصلي انقطع، سيتم استخدام المصدر البديل..."

    ffmpeg -re -i "logo.png" -re -i logo.png  -filter_complex "[1:v]scale=60:60[logo];[0:v][logo]overlay=W-w-50:H-h-900" -c:v libx264 -preset veryfast -maxrate 3000k -bufsize 6000k -c:a aac -b:a 128k -f flv $RTMP_URL/$RTMP_KEY
    
    sleep 5
done
