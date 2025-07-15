#!/usr/bin/env bash

# ---------------------------------------------------------------------------
# Ghostty dot-files installer
# ---------------------------------------------------------------------------
# Creates symlinks from the Neovim, tmux and Starship config of this repository
# to the correct XDG locations. By default, existing files/directories are
# OVERWRITTEN without backup. Use --backup to create timestamped backups.
# ---------------------------------------------------------------------------

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_ENABLED=false

info()  { printf "\033[1;34m[INFO]\033[0m %s\n" "$*"; }
warn()  { printf "\033[1;33m[WARN]\033[0m %s\n" "$*"; }
error() { printf "\033[1;31m[ERROR]\033[0m %s\n" "$*" >&2; }

usage() {
    cat <<EOF
Usage: $0 [OPTIONS]

Install Ghostty-optimized dotfiles by creating symlinks (overwrites by default, use -b for backups).

OPTIONS:
    -h, --help          Show this help message
    -n, --no-backup     Skip backups (default behavior)
    -b, --backup        Create backups of existing files

EXAMPLES:
    $0                  Create symlinks without backups (default)
    $0 --backup         Create symlinks with backups of existing files
    $0 -b               Short form of --backup

NOTE: Symlinks keep configs in sync with the repository automatically.
      Changes to repo files will be immediately reflected in your configs.

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
ln -sf "$REPO_ROOT/nvim" "$HOME/.config/nvim"

# ---------------------------------------------------------------------------
# tmux (~/.tmux.conf)
# ---------------------------------------------------------------------------
info "Installing tmux config…"
backup_if_exists "$HOME/.tmux.conf"
ln -sf "$REPO_ROOT/.tmux.conf" "$HOME/.tmux.conf"

# ---------------------------------------------------------------------------
# Starship (~/.config/starship.toml)
# ---------------------------------------------------------------------------
info "Installing Starship config…"
mkdir -p "$HOME/.config"
backup_if_exists "$HOME/.config/starship.toml"
ln -sf "$REPO_ROOT/starship.toml" "$HOME/.config/starship.toml"

# ---------------------------------------------------------------------------
# Ghostty (XDG_CONFIG_HOME/ghostty/config)
# ---------------------------------------------------------------------------
# Note: On macOS, Ghostty uses ~/Library/Application Support by default.
# To use XDG paths, set: export XDG_CONFIG_HOME="$HOME/.config" in your shell.
info "Installing Ghostty config…"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
mkdir -p "$CONFIG_HOME/ghostty"
backup_if_exists "$CONFIG_HOME/ghostty/config"
ln -sf "$REPO_ROOT/ghostty/config" "$CONFIG_HOME/ghostty/config"
info "  Installed to: $CONFIG_HOME/ghostty/config"
if [[ "$OSTYPE" == "darwin"* ]] && [[ -z "$XDG_CONFIG_HOME" ]]; then
  warn "  On macOS: Set XDG_CONFIG_HOME in your shell for Ghostty to find this config"
  warn "  Add to ~/.zshrc: export XDG_CONFIG_HOME=\"\$HOME/.config\""
fi

info "All done! Symlinks created - your configs are now synced with the repository."
info "Changes to repo files will be immediately reflected in your configs."
info "Launch ghostty/nvim/tmux/starship to verify everything works."
