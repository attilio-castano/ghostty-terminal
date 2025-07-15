# Ghostty-Optimised Dot-files

This repository provides a **minimal, fast and *Ghostty*-friendly development environment**:

> 🪄  **Ghostty** is a modern, GPU-accelerated terminal emulator focused on
> performance, correctness and elegant visuals.  You can grab pre-built
> binaries and learn more at <https://ghostty.org/>.

* **Neovim** 0.11+ configuration written in Lua (`nvim/`)
* **Ghostty** terminal configuration with Nerd Font setup (`ghostty/`)
* Opinionated **tmux** defaults (`.tmux.conf`)
* A colourful **Starship** prompt (`starship.toml`)

Symlink the files into their standard XDG locations and you are ready to hack in seconds.

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

* [ripgrep](https://github.com/BurntSushi/ripgrep) – used by Telescope's live-grep
* [fd](https://github.com/sharkdp/fd) – fast file-finder
* A **Nerd Font** (e.g. *JetBrains Mono NF*) for icons in Neovim plugins like nvim-tree, lualine, telescope, and bufferline. Download from [nerdfonts.com](https://www.nerdfonts.com/)

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

# Install without backups (default)
./install.sh

# Install with backups (creates .bak files)
./install.sh --backup
# or
./install.sh -b

# Show help
./install.sh --help
```

The script is idempotent and by default will **overwrite existing configurations directly**. Use `--backup` to create timestamped backups of existing files/directories before creating symlinks. Once installed, changes to repository files will be immediately reflected in your configs.

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
ln -sf "$PWD/nvim" ~/.config/nvim

# Ghostty
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/ghostty"
ln -sf "$PWD/ghostty/config" "${XDG_CONFIG_HOME:-$HOME/.config}/ghostty/config"

# tmux
ln -sf "$PWD/.tmux.conf" ~/.tmux.conf

# Starship
mkdir -p ~/.config
ln -sf "$PWD/starship.toml" ~/.config/starship.toml
```

Open Neovim – the [lazy.nvim] bootstrapper will fetch and compile all plugins.

---

## 3. Updating

Pull the latest changes with `git pull`. Because the files are symlinked, your configs will automatically reflect the changes immediately. No need to re-run `./install.sh`! Personal overrides can be kept in separate dot-files (e.g. `~/.tmux.local.conf`) and sourced afterwards.

---

## 4. File overview

| Path | Installed to | Purpose |
|------|--------------|---------|
| `nvim/`          | `~/.config/nvim/`        | Lua-based Neovim config (plugins, `init.lua`, docs) |
| `ghostty/`       | `~/.config/ghostty/`     | Minimal Ghostty config with Nerd Font setup |
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
