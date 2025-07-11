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
BACKUP_ENABLED=true

info()  { printf "\033[1;34m[INFO]\033[0m %s\n" "$*"; }
warn()  { printf "\033[1;33m[WARN]\033[0m %s\n" "$*"; }
error() { printf "\033[1;31m[ERROR]\033[0m %s\n" "$*" >&2; }

usage() {
    cat <<EOF
Usage: $0 [OPTIONS]

Install Ghostty-optimized dotfiles with optional backup control.

OPTIONS:
    -h, --help          Show this help message
    -n, --no-backup     Skip backups (overwrite existing files)
    -b, --backup        Create backups (default behavior)

EXAMPLES:
    $0                  Install with backups (default)
    $0 --no-backup      Install without creating backups
    $0 -n               Short form of --no-backup

EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            usage
            exit 0
            ;;
        -n|--no-backup)
            BACKUP_ENABLED=false
            warn "Running in no-backup mode - existing files will be overwritten!"
            shift
            ;;
        -b|--backup)
            BACKUP_ENABLED=true
            shift
            ;;
        *)
            error "Unknown option: $1"
            usage
            exit 1
            ;;
    esac
done

backup_if_exists() {
  local target=$1
  if [ -e "$target" ] || [ -L "$target" ]; then
    if [ "$BACKUP_ENABLED" = true ]; then
      local backup="${target}.bak.${TIMESTAMP}"
      warn "Backing up $target -> $backup"
      mv "$target" "$backup"
    else
      warn "Overwriting $target (no backup)"
      rm -rf "$target"
    fi
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
