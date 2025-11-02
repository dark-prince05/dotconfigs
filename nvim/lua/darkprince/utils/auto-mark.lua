-- lua/darkprince/utils/auto-mark.lua

local M = {}

function M.enable_auto_mark(delay)
  delay = delay or 3000
  local timer = vim.loop.new_timer()
  local last_line = nil

  vim.api.nvim_create_autocmd("CursorMoved", {
    callback = function()
      local current_line = vim.api.nvim_win_get_cursor(0)[1]
      if current_line ~= last_line then
        last_line = current_line
        timer:stop()
        timer:start(delay, 0, vim.schedule_wrap(function()
          if vim.api.nvim_win_get_cursor(0)[1] == last_line then
            vim.cmd("normal! m'")
          end
        end))
      end
    end,
  })
end

return M

