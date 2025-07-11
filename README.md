# Ghostty-Optimised Dot-files

This repository provides a **minimal, fast and *Ghostty*-friendly development environment**:

> 🪄  **Ghostty** is a modern, GPU-accelerated terminal emulator focused on
> performance, correctness and elegant visuals.  You can grab pre-built
> binaries and learn more at <https://ghostty.org/>.

* **Neovim** 0.11+ configuration written in Lua (`nvim/`)
* Opinionated **tmux** defaults (`.tmux.conf`)
* A colourful **Starship** prompt (`starship.toml`)

Copy (or symlink) the files into their standard XDG locations and you are ready to hack in seconds.

---

## 1. Requirements

Install the base tools first (via your package manager):

* Neovim **≥ 0.11** (with LuaJIT)
* tmux
* [Starship](https://starship.rs/)
* git
* *Optional but recommended:* [Ghostty](https://ghostty.org/) itself to enjoy
  transparency, fine-grained palette control, font shaping and other goodies
  that this configuration auto-detects.

Recommended helpers for the Neovim setup:

* [ripgrep](https://github.com/BurntSushi/ripgrep) – used by Telescope’s live-grep
* [fd](https://github.com/sharkdp/fd) – fast file-finder
* A Nerd Font (e.g. *JetBrains Mono NF*) for icons / glyphs

Ghostty enhancements kick-in automatically when **either** of these is true:

```text
$TERM == "xterm-ghostty"        # exported by Ghostty
$GHOSTTY_RESOURCES_DIR is set   # ditto
```

---

## 2. Quick installation

Clone the repo **anywhere** (it does not have to live under `~/.config`):

```bash
git clone https://github.com/your-user/ghostty-terminal.git
cd ghostty-terminal

# Install with backups (default - recommended)
./install.sh

# Install without backups (overwrites existing files)
./install.sh --no-backup
# or
./install.sh -n

# Show help
./install.sh --help
```

The script is idempotent and by default will **back-up existing files/directories** by appending a time-stamp suffix before overwriting them. Use `--no-backup` to skip creating backups and directly overwrite existing configurations.

Verify everything works:

```bash
nvim              # plugins are installed/compiled on first start
tmux
eval "$(starship init bash)"   # for Bash (see Starship docs for zsh/fish)
```

---

### Manual setup (if you prefer)

```bash
# Neovim
mkdir -p ~/.config
cp -r nvim ~/.config/nvim

# tmux
cp .tmux.conf ~/.tmux.conf

# Starship
mkdir -p ~/.config
cp starship.toml ~/.config/starship.toml
```

Open Neovim – the [lazy.nvim] bootstrapper will fetch and compile all plugins.

---

## 3. Updating

Pull the latest changes and re-run `./install.sh`. Because the files are copied verbatim it is safe to keep personal overrides in separate dot-files (e.g. `~/.tmux.local.conf`) and source them afterwards.

---

## 4. File overview

| Path | Installed to | Purpose |
|------|--------------|---------|
| `nvim/`          | `~/.config/nvim/`        | Lua-based Neovim config (plugins, `init.lua`, docs) |
| `.tmux.conf`     | `~/.tmux.conf`           | Mouse, Unicode, Alt-arrow pane nav, large scrollback |
| `starship.toml`  | `~/.config/starship.toml`| Colourful prompt (Git, Python, Node.js, duration…) |

---

## 5. Uninstall

Remove the files/directories listed above; nothing else is written to disk.

---

## 6. Licence

MIT – see `LICENSE` (if present) or the repository metadata.

---

[lazy.nvim]: https://github.com/folke/lazy.nvim
