return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "*", -- Enable for all file types
      html = { mode = "background", css = true }, -- Show color as background in HTML
      css = { css = true }, -- Enable all colors in CSS
      javascript = { css = true }, -- Enable all colors in javascript
      "!vim", -- Exclude vim files from colorizing
    })
  end,
}
