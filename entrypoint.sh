#!/bin/bash
set -e

# サーバ起動エラー回避
rm -f /app/tmp/pids/server.pid

exec "$@"
