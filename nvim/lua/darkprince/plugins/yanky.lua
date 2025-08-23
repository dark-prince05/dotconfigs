return {
  "gbprod/yanky.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    local yanky = require("yanky")
    local mapping = require("yanky.telescope.mapping")
    local actions = require("telescope.actions")

    yanky.setup({
      ring = {
        history_length = 100,
        storage = "shada",
        sync_with_numbered_registers = true,
      },
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 300,
      },
      picker = {
        telescope = {
          use_default_mappings = false,
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
              ["<CR>"] = mapping.set_register(),
            },
            n = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
              ["<CR>"] = mapping.set_register(),
            },
          },
        },
      },
      preserve_cursor_position = { enabled = true },
    })

    require("telescope").load_extension("yank_history")

    local keymap = vim.keymap
    keymap.set("n", "p", "<Plug>(YankyPutAfter)")
    keymap.set("n", "P", "<Plug>(YankyPutBefore)")
    keymap.set("n", "<C-n>", "<Plug>(YankyCycleForward)")
    keymap.set("n", "<C-m>", "<Plug>(YankyCycleBackward)")
    keymap.set("n", "<leader>p", "<cmd>Telescope yank_history<CR>", { desc = "Open Yank History" })
  end,
}
