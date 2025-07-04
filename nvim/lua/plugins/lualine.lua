return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Always load lualine for statusline
    lazy = false,
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
      })
      -- Transparent background for Ghostty
      local in_ghostty = require("util.ghostty").active
      if in_ghostty then
        local hl = vim.api.nvim_set_hl
        -- Lualine highlight groups
        hl(0, "LualineNormal",   { bg = "none" })
        hl(0, "LualineNormalNC", { bg = "none" })
        hl(0, "LualineInsert",   { bg = "none" })
        hl(0, "LualineVisual",   { bg = "none" })
        hl(0, "LualineReplace",  { bg = "none" })
        hl(0, "LualineCommand",  { bg = "none" })
        -- Fallback statusline groups
        hl(0, "StatusLine",      { bg = "none" })
        hl(0, "StatusLineNC",    { bg = "none" })
      end
    end,
  },
}