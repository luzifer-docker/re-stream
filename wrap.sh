#!/usr/local/bin/dumb-init /bin/bash
set -euxo pipefail

VIDEO_URL=${VIDEO_URL:-$1}
ICECAST_URL=${ICECAST_URL:-$2}

ICECAST_DESC=${ICECAST_DESC:-Re-Stream of ${VIDEO_URL}}
ICECAST_NAME=${ICECAST_NAME:-Re-Stream}
ICECAST_WEBSITE=${ICECAST_WEBSITE:-$VIDEO_URL}

streamlink "${VIDEO_URL}" best -O | \
  ffmpeg -i - -vn -c:a libvorbis \
    -legacy_icecast 1 -content_type audio/ogg \
    -ice_name "${ICECAST_NAME}" -ice_url "${ICECAST_WEBSITE}" \
    -ice_description "${ICECAST_DESC}" \
    "${ICECAST_URL}"
