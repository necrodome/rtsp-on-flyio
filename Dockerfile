FROM aler9/rtsp-simple-server:v0.20.4 AS rtsp
FROM alpine:edge

# FFmpeg
RUN apk add --no-cache ffmpeg

# Gstreamer on edge
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing gst-rtsp-server gstreamer-tools gst-plugins-good gst-plugins-bad gst-plugins-ugly ttf-liberation

# Vim to edit conf files
RUN apk add --no-cache vim

COPY --from=rtsp /rtsp-simple-server /
COPY rtsp-simple-server.yml /
COPY data /data
ENTRYPOINT [ "/rtsp-simple-server" ]
