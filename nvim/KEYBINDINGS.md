# Key-binding Quick Reference

This file is a condensed cheat-sheet of every non-trivial key-mapping
defined by the configuration (plugins included).  The leader key is
`<Space>`.

---

## Core Neovim

Basic editor commands and window navigation.

| Mode | Keys | Action |
|------|------|--------|
| **Normal** | `<leader>w` | Save current buffer |
| Normal | `<A-h>` | Focus split **left** |
| Normal | `<A-j>` | Focus split **below** |
| Normal | `<A-k>` | Focus split **above** |
| Normal | `<A-l>` | Focus split **right** |

---

## Bufferline

Buffer (tab) navigation and management.

| Mode | Keys | Action |
|------|------|--------|
| Normal | `<A-,>` | Previous buffer |
| Normal | `<A-.>` | Next buffer |
| Normal | `<A-1>`…`<A-9>` | Jump to buffer *n* |
| Normal | `<leader>bp` | Previous buffer |
| Normal | `<leader>bn` | Next buffer |

---

## Nvim-Tree

File explorer toggle and navigation.

| Mode | Keys | Action |
|------|------|--------|
| Normal | `<leader>e` | Toggle file tree |

### Inside Nvim-Tree window

| Key | Description |
|-----|-------------|
| `l` | Smart open (just like `o`) |
| `h` | Collapse directory / go to parent |
| `v` | Open node in **vertical** split |
| `s` | Open node in **horizontal** split |
| `t` | Open node in **new tab** |
| `C` | Change root to node |
| `-` | Change root to parent |
| `H` | Toggle dot-files |
| `z` | Collapse all |

---

## Git Integration

### Gitsigns

In-editor git hunk navigation and actions.

| Mode | Keys | Action |
|------|------|--------|
| Normal | `]c` | Next Git hunk |
| Normal | `[c` | Previous Git hunk |
| Normal | `<leader>gs` | Stage hunk |
| Normal | `<leader>gr` | Reset hunk |
| Normal | `<leader>gS` | Stage buffer |
| Normal | `<leader>gR` | Reset buffer |
| Normal | `<leader>gp` | Preview hunk |
| Normal | `<leader>gb` | Blame line |
| Visual | `<leader>gs` | Stage selected lines |
| Visual | `<leader>gr` | Reset selected lines |

### Diffview

VS Code-like git diff viewing and file history.

| Mode | Keys | Action |
|------|------|--------|
| Normal | `<leader>gd` | Open diff view |
| Normal | `<leader>gh` | File history (current file) |
| Normal | `<leader>gH` | File history (repository) |
| Normal | `<leader>gc` | Close diff view |

---

## Telescope

Fuzzy finding for files, text, and more.

| Mode | Keys | Action |
|------|------|--------|
| Normal | `<leader>ff` | Find files |
| Normal | `<leader>fg` | Live grep |
| Normal | `<leader>fb` | List buffers |
| Normal | `<leader>fh` | Help tags |

### Inside Telescope picker

| Mode | Key | Action |
|------|-----|--------|
| Insert | `<C-j>` / `<C-k>` | Move selection down / up |
| Insert | `<Esc>` or `<C-c>` | Close picker |

*(These are plugin defaults and can be changed via Telescope's
`defaults.mappings` table.)*

---

Keep this file open in a split (`:vsplit KEYBINDINGS.md`) for quick
reference while you are getting used to the bindings.