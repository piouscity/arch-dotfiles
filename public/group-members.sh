#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 || -z "$1" ]]; then
  echo "Usage: $0 <group_name>" >&2
  exit 1
fi

GROUP="$1"

if ! GROUP_ENTRY=$(getent group "$GROUP"); then
  echo "Error: Group '$GROUP' not found." >&2
  exit 1
fi

GID=$(echo "$GROUP_ENTRY" | cut -d: -f3)

{
  echo "$GROUP_ENTRY" | cut -d: -f4 | tr ',' '\n'
  awk -F: -v gid="$GID" '$4 == gid { print $1 }' /etc/passwd
} | grep -v '^$' | sort -u

