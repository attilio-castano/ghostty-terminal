# Changelog

All notable changes to this Neovim configuration will be documented in
this file.  The format is loosely based on [Keep a Changelog].

## Unreleased (main)

### Added

* Helper `lua/util/ghostty.lua` that centralises Ghostty-detection logic.
* `CHANGELOG.md` (this file) and revamped `README.md`.
* UTF-8 position-encoding enforced for all LSP clients to silence the
  mixed UTF-16/UTF-8 warning.
* Cleaned up old `setup_handlers` fallback now that mason-lspconfig v2
  no longer provides it; servers are configured manually in a simple
  loop.

### Changed

* Switched to the native **Ruff** LSP that ships with the `ruff` binary
  (`ruff` in mason-lspconfig / lspconfig).  The old Python based
  `ruff_lsp` implementation is deprecated and no longer installed.
* Documentation updated for Neovim 0.11 and to note that
  *nvim-autopairs* is intentionally disabled.
* Removed the indent-blankline v2 fallback; the config now assumes
  indent-blankline ≥3 (`ibl` module) which is standard on Neovim 0.11.
* Updated Mason plugins to new upstream namespace
  (`mason-org/mason.nvim`, `mason-org/mason-lspconfig.nvim`).
* Adapted to mason-lspconfig v2 – option `automatic_enable=false` now
  used (the old `automatic_installation` flag was removed).

### Removed

* Deleted `lua/plugins/autopairs.lua` – the plugin was intentionally
  disabled and keeping the file caused confusion.

### Removed

* `SUGGESTED_PLUGINS.md` – the list was outdated.  Future suggestions
  will live in the wiki.

---

[Keep a Changelog]: https://keepachangelog.com/en/1.1.0/
