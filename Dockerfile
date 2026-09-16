FROM alpine:latest
RUN apk add --no-cache curl unzip
RUN curl -L -H "Cache-Control: no-cache" -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip xray.zip -d /xray \
    && chmod +x /xray/xray \
    && rm -rf xray.zip
COPY config.json /xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 10000
CMD ["/entrypoint.sh"]
