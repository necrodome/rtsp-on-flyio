Run an [RTSP server](https://github.com/aler9/rtsp-simple-server) on fly.io, for free!

This repo comes with a few RTSP streams published using GStreamer and FFmpeg as examples. Edit rtsp-simple-server.yml to remove them or add your own streams. Check https://github.com/aler9/rtsp-simple-server for full documentation.


Sample streams:
- [rtsp://rtspstream.com/pattern](rtsp://rtspstream.com/pattern) 
- [rtsp://rtspstream.com/ball](rtsp://rtspstream.com/ball)
- [rtsp://rtspstream.com/parking](rtsp://rtspstream.com/parking)

# Deploying to fly.io

**1. Clone this repo**
```bash
$ git clone https://github.com/necrodome/rtsp-on-flyio.git

```

**2. Launch an app on fly.io**
```bash
$ fly launch
```

Pick **Yes** when it asks "? Would you like to copy its configuration to the new app?"

**No** for anything else.

**3. Set secrets for publishing streams**
```bash
$ flyctl secrets set RTSP_PATHS_ALL_PUBLISHUSER=<your username>
$ flyctl secrets set RTSP_PATHS_ALL_PUBLISHPASS=<your password>
```

**4. Allocate a dedicated IPv4 address**
```bash
$ fly ips allocate-v4
```
**5. Deploy**
```bash
$ fly deploy
```

**6. Check published streams with your favourite video player**
```bash
$ mpv rtsp://<your app name>.fly.dev/pattern
$ mpv rtsp://<your app name>.fly.dev/ball
$ mpv rtsp://<your app name>.fly.dev/parking
```
