return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    modes = {
      search = {
        enabled = true,
      },
      char = {
        enabled = false,
      },
    },
  },
  -- stylua: ignore
  keys = {
  {
    "n",
    mode = { "n", "x", "o" },
    function()
      -- check if there is an active search highlight
      local search_pattern = vim.fn.getreg("/")
      if search_pattern ~= "" and vim.v.hlsearch == 1 then
        -- continue normal search navigation
        vim.cmd("normal! n")
      else
        -- no active search → use Flash
        require("flash").jump()
      end
    end,
    desc = "Smart Flash or Next Search Result",
  },
    {
    "N",
  mode = { "n", "x", "o" },
  function()
    local search_pattern = vim.fn.getreg("/")
    if search_pattern ~= "" and vim.v.hlsearch == 1 then
      vim.cmd("normal! N") -- previous search result
    else
      require("flash").treesitter()
    end
  end,
  desc = "Smart Flash Treesitter or Previous Search",
    },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
