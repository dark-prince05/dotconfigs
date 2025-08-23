return {
  "mbbill/undotree",
  config = function()
    local function toggle_undotree_and_focus()
      vim.cmd.UndotreeToggle()
      vim.defer_fn(function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          local bufname = vim.api.nvim_buf_get_name(buf)
          if bufname:match("undotree") then
            vim.api.nvim_set_current_win(win)
            break
          end
        end
      end, 50) -- Delay slightly to ensure the window opens
    end

    vim.keymap.set("n", "<leader>u", toggle_undotree_and_focus, { desc = "Toggle UndoTree and focus" })
  end,
}
