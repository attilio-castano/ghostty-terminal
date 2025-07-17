# Vim Motions Reference

## Mode Switching

| Command | Action | From mode |
|---------|--------|-----------|
| `Esc` | Enter NORMAL mode | INSERT |
| `i` | Insert before cursor | NORMAL |
| `I` | Insert at beginning of line | NORMAL |
| `a` | Insert after cursor | NORMAL |
| `A` | Insert at end of line | NORMAL |
| `o` | Open line below | NORMAL |
| `O` | Open line above | NORMAL |

## Navigation (NORMAL mode)

| Command | Action |
|---------|--------|
| `h/j/k/l` | Move left/down/up/right |
| `w` | Next word |
| `e` | End of word |
| `b` | Previous word |
| `0` | Beginning of line |
| `$` | End of line |
| `^` | First non-blank character |
| `gg` | Beginning of input |
| `G` | End of input |

## Editing (NORMAL mode)

| Command | Action |
|---------|--------|
| `x` | Delete character |
| `dd` | Delete line |
| `D` | Delete to end of line |
| `dw/de/db` | Delete word/to end/back |
| `cc` | Change line |
| `C` | Change to end of line |
| `cw/ce/cb` | Change word/to end/back |
| `.` | Repeat last change |

## Additional Useful Commands

### Undo/Redo
| Command | Action |
|---------|--------|
| `u` | Undo |
| `Ctrl-r` | Redo |

### Copy/Paste
| Command | Action |
|---------|--------|
| `yy` | Yank (copy) line |
| `yw/ye/yb` | Yank word/to end/back |
| `p` | Paste after cursor |
| `P` | Paste before cursor |

### Visual Mode
| Command | Action |
|---------|--------|
| `v` | Enter visual mode |
| `V` | Enter visual line mode |
| `Ctrl-v` | Enter visual block mode |