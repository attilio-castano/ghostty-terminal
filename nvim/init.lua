-- init.lua ------------------------------------------------------------
-- Author: Attilio 
-- Clean, minimal, Ghostty‑aware Neovim config
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- 0. Leader / globals
-----------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-----------------------------------------------------------------------
-- 1. Terminal / GUI settings
-----------------------------------------------------------------------
local in_ghostty = require("util.ghostty").active

vim.opt.termguicolors = true
vim.opt.background   = "dark"

if in_ghostty then
    -- inherit Ghostty’s translucent background
    vim.api.nvim_set_hl(0, "Normal",       { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none" })
    -- Diagnostic undercurls that pop on a dark glassy backdrop
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#ff5c5c" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = "#f0e130" })
else
    -- For non-Ghostty terminals we keep opaque background; colourscheme is
    -- selected later (gruvbox fallback) by lua/plugins/colorscheme.lua
end

-----------------------------------------------------------------------
-- 2. Editor behaviour tweaks (feel free to extend)
-----------------------------------------------------------------------
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.signcolumn     = "yes:1"
vim.opt.clipboard      = "unnamedplus"
vim.opt.updatetime     = 250
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
-----------------------------------------------------------------------
-- 3. Bootstrap lazy.nvim
-----------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--depth=1",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ---------------------------------------------------------------------
-- 4. Plugins ----------------------------------------------------------
-- ---------------------------------------------------------------------
require("lazy").setup({
  -- Colourscheme – load first so subsequent plugins can link highlight groups
  require("plugins.colorscheme"),

  -- Core plugins
  require("plugins.treesitter"),
  require("plugins.nvimtree"),
  require("plugins.gitsigns"),    -- git diff signs & hunk actions
  require("plugins.lspconfig"),   -- Language Server Protocol (LSP) config for Python (Pyright & Ruff)

  -- UI enhancements
  require("plugins.indent-blankline"), -- indent guides
  require("plugins.lualine"),     -- statusline
  require("plugins.bufferline"),  -- buffer/tabline
  require("plugins.whichkey"),    -- keybinding hints
  require("plugins.telescope"),   -- fuzzy finder
  -- Add more plugins here
})

-----------------------------------------------------------------------
-- 5. Extra keymaps ----------------------------------------------------
-----------------------------------------------------------------------
local map = vim.keymap.set
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
-- Fast window navigation with Alt+h/j/k/l
map("n", "<A-h>", "<C-w>h", { desc = "Move to window on the left" })
map("n", "<A-j>", "<C-w>j", { desc = "Move to window below" })
map("n", "<A-k>", "<C-w>k", { desc = "Move to window above" })
map("n", "<A-l>", "<C-w>l", { desc = "Move to window on the right" })
-- (Nvim‑tree mapping declared in its plugin spec above)

