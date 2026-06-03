#!/usr/bin/env bash

# Start/ensure the default tmux sessions, then attach to the current work session.
set -euo pipefail

DEFAULT_ATTACH_SESSION="${1:-s}"

"$HOME/.config/tmux/scripts/bootstrap-sessions.sh"

if [ -n "${TMUX:-}" ]; then
  tmux switch-client -t "$DEFAULT_ATTACH_SESSION"
else
  tmux attach-session -t "$DEFAULT_ATTACH_SESSION"
fi
