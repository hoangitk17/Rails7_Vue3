#!/bin/bash

set -e
bundle check || bundle install --binstubs="$BUNDLE_BIN"

rm -f tmp/pids/server.pid

exec "$@"