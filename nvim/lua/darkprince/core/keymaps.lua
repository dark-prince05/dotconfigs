vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness
---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "<C-k>", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

--window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Save the changes" })

-- Yank without copying keymap the clipboard
-- keymap.set("n", "y", '"*y', { desc = "Yank without clipboard" })
-- keymap.set("v", "y", '"*y', { desc = "Yank without clipboard" })

-- Copy to clipboard
keymap.set("n", "<C-y>", '"+y', { desc = "Yank to clipboard" })
keymap.set("v", "<C-y>", '"+y', { desc = "Yank to clipboard" })

-- Paste from clipboard
keymap.set("n", "<C-p>", '"+p', { desc = "Paste from clipboard" })
keymap.set("i", "<C-p>", '"+p', { desc = "Paste from clipboard" })
keymap.set("v", "<C-p>", '"+p', { desc = "Paste from clipboard" })

-- -- Paste without using clipboard
-- keymap.set("n", "p", '"*p', { desc = "Paste without clipboard" })
-- keymap.set("v", "p", '"*p', { desc = "Paste without clipboard" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x', { desc = "Delete without yanking" })

-- Move line up
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Move line down
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })

--buffer keymaps
keymap.set("n", "<leader>bo", ":enew<CR>", { desc = "Open a new buffer" }) -- Open a new buffer
keymap.set("n", "<leader>bx", ":bd<CR>", { desc = "Close the current buffer" }) -- Close the current buffer
keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Go to next buffer" }) -- Navigate to the next buffer
keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Go to previous buffer" }) -- Navigate to the previous buffer
keymap.set("n", "<leader>bl", ":ls<CR>", { desc = "List all buffers" }) -- List all buffers
keymap.set("n", "<leader>bb", ":Telescope buffers<CR>", { desc = "Pick a buffer to switch to" }) -- Pick a buffer to switch to (useful with telescope or other plugins)
keymap.set("n", "\\", ":bnext<CR>", { desc = "Go to next buffer" })
keymap.set("n", "|", ":bprevious<CR>", { desc = "Go to previous buffer" })
keymap.set("i", "<C-\\>", "<Esc>:bnext<CR>i", { desc = "Next buffer (insert mode)" })

-- Make `0` go to the end of the line
keymap.set("", "0", "$", { desc = "Go to the end of the line" })

-- Make `1` go to the start of the line
keymap.set("", "`", "0", { desc = "Go to the start of the line" })

-- Horizontal movement in insert mode
keymap.set("i", "<M-h>", "<Left>", { desc = "Move left in insert mode" })
keymap.set("i", "<M-l>", "<Right>", { desc = "Move right in insert mode" })

-- Vertical movement in insert mode
keymap.set("i", "<M-j>", "<Down>", { desc = "Move down in insert mode" })
keymap.set("i", "<M-k>", "<Up>", { desc = "Move up in insert mode" })

-- Shortcut for find and replace with placeholders
keymap.set("n", "<leader>rr", ":%s///g<Left><Left><Left>", { desc = "Find and Replace" })

-- Yanky keymaps
keymap.set("n", "p", "<Plug>(YankyPutAfter)")
keymap.set("n", "P", "<Plug>(YankyPutBefore)")

--Yanky cycly through history
keymap.set("n", "<C-n>", "<Plug>(YankyCycleForward)")
keymap.set("n", "<C-m>", "<Plug>(YankyCycleBackward)")

-- Open yank history with telescope
keymap.set("n", "<leader>p", "<cmd>Telescope yank_history<CR>", { desc = "Open Yank History" })
