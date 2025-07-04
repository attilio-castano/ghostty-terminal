#!/usr/bin/env bash

# ---------------------------------------------------------------------------
# Ghostty dot-files installer
# ---------------------------------------------------------------------------
# Copies the Neovim, tmux and Starship config of this repository into the
# correct XDG locations.  Existing files/directories are moved aside with a
# timestamp suffix so the script is (reasonably) safe to run repeatedly.
# ---------------------------------------------------------------------------

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"

info()  { printf "\033[1;34m[INFO]\033[0m %s\n" "$*"; }
warn()  { printf "\033[1;33m[WARN]\033[0m %s\n" "$*"; }

backup_if_exists() {
  local target=$1
  if [ -e "$target" ] || [ -L "$target" ]; then
    local backup="${target}.bak.${TIMESTAMP}"
    warn "Backing up $target -> $backup"
    mv "$target" "$backup"
  fi
}

# ---------------------------------------------------------------------------
# Neovim (~/.config/nvim)
# ---------------------------------------------------------------------------
info "Installing Neovim config…"
mkdir -p "$HOME/.config"
backup_if_exists "$HOME/.config/nvim"
cp -R "$REPO_ROOT/nvim" "$HOME/.config/nvim"

# ---------------------------------------------------------------------------
# tmux (~/.tmux.conf)
# ---------------------------------------------------------------------------
info "Installing tmux config…"
backup_if_exists "$HOME/.tmux.conf"
cp "$REPO_ROOT/.tmux.conf" "$HOME/.tmux.conf"

# ---------------------------------------------------------------------------
# Starship (~/.config/starship.toml)
# ---------------------------------------------------------------------------
info "Installing Starship config…"
mkdir -p "$HOME/.config"
backup_if_exists "$HOME/.config/starship.toml"
cp "$REPO_ROOT/starship.toml" "$HOME/.config/starship.toml"

info "All done!  Launch nvim/tmux/starship to verify everything works."
