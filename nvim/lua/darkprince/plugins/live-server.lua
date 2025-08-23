return {
  "ngtuonghy/live-server-nvim",
  event = "VeryLazy",
  build = ":LiveServerInstall",
  config = function()
    local live_server = require("live-server-nvim")

    live_server.setup({
      custom = {
        "--port=8080",
        "--no-css-inject",
      },
      serverPath = vim.fn.stdpath("data") .. "/live-server/", -- default
      open = "folder", -- folder|cwd
    })

    vim.keymap.set("n", "<leader>ls", function()
      live_server.start()
    end, { desc = "Start Live Server" })

    vim.keymap.set("n", "<leader>lt", function()
      live_server.stop()
    end, { desc = "Stop Live Server" })
  end,
}
