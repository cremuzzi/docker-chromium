FROM alpine:edge

LABEL maintainer="Carlos Remuzzi <carlosremuzzi@gmail.com>"
LABEL org.label-schema.description="Chromium"
LABEL org.label-schema.name="chromium"

RUN apk add --no-cache \
        alsa-lib \
        alsa-utils \
        alsaconf \
        dbus \
        ffmpeg-libs \
        chromium \
        ttf-dejavu \
        tzdata \
    && adduser -u 1000 -s /bin/sh -D chromium \
    && mkdir -p /home/chromium/.config/chromium \
    && chown -R chromium:chromium /home/chromium/

USER chromium

WORKDIR /home/chromium

VOLUME ["/home/chromium/.config/chromium","/home/chromium/Downloads"]

CMD ["chromium-browser"] 
