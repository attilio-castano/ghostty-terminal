# Key-binding Quick Reference

This file is a condensed cheat-sheet of every non-trivial key-mapping
defined by the configuration (plugins included).  The leader key is
`<Space>`.

| Mode | Keys | Action | Where / Plugin |
|------|------|--------|----------------|
| **Normal** | `<leader>w` | Save current buffer | core |
| Normal | `<A-h>` | Focus split **left** | core |
| Normal | `<A-j>` | Focus split **below** | core |
| Normal | `<A-k>` | Focus split **above** | core |
| Normal | `<A-l>` | Focus split **right** | core |
| Normal | `<A-,>` | Previous buffer | bufferline |
| Normal | `<A-.>` | Next buffer | bufferline |
| Normal | `<A-1>`…`<A-9>` | Jump to buffer *n* | bufferline |
| Normal | `<leader>bp` | Previous buffer | bufferline |
| Normal | `<leader>bn` | Next buffer | bufferline |
| Normal | `<leader>e` | Toggle file tree | nvim-tree |
| Normal | `]c` | Next Git hunk | gitsigns |
| Normal | `[c` | Previous Git hunk | gitsigns |
| Normal | `<leader>gs` | Stage hunk | gitsigns |
| Normal | `<leader>gr` | Reset hunk | gitsigns |
| Normal | `<leader>gS` | Stage buffer | gitsigns |
| Normal | `<leader>gR` | Reset buffer | gitsigns |
| Normal | `<leader>gp` | Preview hunk | gitsigns |
| Normal | `<leader>gb` | Blame line | gitsigns |
| Normal | `<leader>ff` | Find files | telescope |
| Normal | `<leader>fg` | Live grep | telescope |
| Normal | `<leader>fb` | List buffers | telescope |
| Normal | `<leader>fh` | Help tags | telescope |

---

## Nvim-Tree buffer specific mappings

These are active **inside** the tree window.

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

## Telescope default mappings

| Mode | Key | Action |
|------|-----|--------|
| Insert | `<C-j>` / `<C-k>` | Move selection down / up |
| Insert | `<Esc>` or `<C-c>` | Close picker |

*(These are plugin defaults and can be changed via Telescope’s
`defaults.mappings` table.)*

---

Keep this file open in a split (`:vsplit KEYBINDINGS.md`) for quick
reference while you are getting used to the bindings.
