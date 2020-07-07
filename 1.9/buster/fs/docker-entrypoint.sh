#!/bin/bash
set -e

# Variable BACKEND_STORE could has been overridden. We need to check it does point to an existing directory.
if [ ! -d $BACKEND_STORE ]; then
  printf 'Path |%s| does not exist. Please check you have mounted it as a volume.\n' "$BACKEND_STORE" >&2
  exit 1
fi

exec "$@" \
    --backend-store-uri "file://${BACKEND_STORE}" \
    --default-artifact-root "file://${BACKEND_STORE}" \
    --host "$NETWORK_INTERFACE" \
    --port 5000
    --expose-prometheus /metrics