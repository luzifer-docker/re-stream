# luzifer-docker / re-stream

Run a Docker container to supply audio of your YouTube Live-Stream through an IceCast for mobile listeners in OGG format

## Usage

```bash
## Build container (optional)
$ docker build -t luzifer/re-stream .

## Execute curator
$ docker run --rm -ti luzifer/re-stream <your live-stream URL> icecast://source:pass@host:port/stream.ogg
```
