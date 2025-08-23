return {
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local bg = "#011628"
      local bg_dark = "#011423"
      local bg_highlight = "#143652"
      local bg_search = "#0A64AC"
      local bg_visual = "#275378"
      local fg = "#CBE0F0"
      local fg_dark = "#B4D0E9"
      local fg_gutter = "#627E97"
      local border = "#547998"

      require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
        on_colors = function(colors)
          colors.bg = bg
          colors.bg_dark = bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_statusline = bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
        end,
        on_highlights = function(hl, c)
          -- Customize line number colors to white
          hl.LineNr = { fg = "#FFFFFF" }
          hl.CursorLineNr = { fg = "#FFFFFF" }
          hl.LineNrAbove = { fg = "#FFFFFF" }
          hl.LineNrBelow = { fg = "#FFFFFF" }
          -- Customize comments color to white
          hl.Comment = { fg = "#6f6ded", italic = true }
          -- nvim-cmp popup transparency
          hl.Pmenu = { bg = "NONE", fg = c.fg } -- normal completion menu
          hl.PmenuSel = { bg = c.bg_highlight, fg = c.fg } -- selected item
          hl.PmenuSbar = { bg = "NONE" } -- scrollbar background
          hl.PmenuThumb = { bg = c.fg_gutter } -- scrollbar thumb
        end,
      })

      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
