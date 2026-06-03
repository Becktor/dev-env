#!/usr/bin/env bash

# Create the baseline tmux sessions used on this machine.
# This script is intentionally idempotent so it can run on tmux server start,
# from the default-session launcher, or after a config reload.
set -euo pipefail

existing_dir_or_home() {
  local dir="$1"
  if [ -d "$dir" ]; then
    printf '%s\n' "$dir"
  else
    printf '%s\n' "$HOME"
  fi
}

ensure_session() {
  local session_name="$1"
  shift

  if tmux has-session -t "$session_name" 2>/dev/null; then
    return 0
  fi

  local first_window="$1"
  local first_dir="$2"
  shift 2

  tmux new-session -d -s "$session_name" -n "$first_window" -c "$first_dir"

  while [ "$#" -gt 0 ]; do
    local window_name="$1"
    local window_dir="$2"
    shift 2
    tmux new-window -t "$session_name" -n "$window_name" -c "$window_dir"
  done

  tmux select-window -t "$session_name:1"
}

fieldai_dir="$(existing_dir_or_home "$HOME/git/fai/fieldai-monorepo")"
w3_dir="$(existing_dir_or_home "$HOME/git/fai/worktrees/w3")"
dotfiles_dir="$(existing_dir_or_home "$HOME/git/dotfiles")"

# The two always-present sessions: the current working session (`s`) and `main`.
ensure_session "s" \
  "bash" "$fieldai_dir" \
  "pi" "$w3_dir" \
  "pi" "$dotfiles_dir" \
  "bash" "$fieldai_dir" \
  "bash" "$HOME"

ensure_session "main" \
  "bash" "$w3_dir" \
  "bash" "$w3_dir" \
  "bash" "$dotfiles_dir" \
  "bash" "$dotfiles_dir"
