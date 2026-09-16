#!/bin/sh
PORT=${PORT:-10000}
sed -i "s/\"port\": 10000/\"port\": $PORT/g" /xray/config.json
exec /xray/xray -config /xray/config.json
