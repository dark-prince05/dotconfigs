local keymap = vim.keymap
local opt = vim.opt
vim.g.mapleader = " "
local vscode = require("vscode")

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

if vim.g.vscode then
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
		if vim.v.shell_error ~= 0 then
			vim.api.nvim_echo({
				{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
				{ out,                            "WarningMsg" },
				{ "\nPress any key to exit..." },
			}, true, {})
			vim.fn.getchar()
			os.exit(1)
		end
	end
	vim.opt.rtp:prepend(lazypath)

	-- Setup lazy.nvim
	require("lazy").setup({
		spec = {
			-- multi-cursor
			{
				"vscode-neovim/vscode-multi-cursor.nvim",
				event = "VeryLazy",
				cond = not not vim.g.vscode,
				opts = {},
			},
			-- substitute
			{
				"gbprod/substitute.nvim",
				config = function()
					local substitute = require("substitute")
					substitute.setup()
					-- set keymaps
					local keymap = vim.keymap -- for conciseness
					keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
					keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
					keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
					keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
				end,
			},
			-- surround
			{
				"kylechui/nvim-surround",
				version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
				event = "VeryLazy",
				config = function()
					require("nvim-surround").setup({
						-- Configuration here, or leave empty to use defaults
					})
				end
			},
		},
		-- Configure any other settings here. See the documentation for more details.
		-- colorscheme that will be used when installing plugins.
		install = { colorscheme = { "habamax" } },
		-- automatically check for plugin updates
		checker = { enabled = true },
	})

	keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Save the changes" })

	keymap.set("v", "p", "P", { desc = "paste without copying" })

	keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear highlights" })

	keymap.set("n", "<leader>vn", ":e ~/.config/vscode-nvim/init.lua<CR>", { desc = "Opens vscode nvim config file" })

	-- Paste from clipboard
	keymap.set("n", "<C-p>", function()
		vscode.call("editor.action.clipboardPasteAction")
	end, { desc = "Paste from clipboard" })
	keymap.set("i", "<C-p>", function()
		vscode.call("editor.action.clipboardPasteAction")
	end, { desc = "Paste from clipboard" })
	keymap.set("v", "<C-p>", function()
		vscode.call("editor.action.clipboardPasteAction")
	end, { desc = "Paste from clipboard" })

	-- Basic split management (matching your original keybinds)
	keymap.set("n", "<leader>sv", function()
		vscode.call("workbench.action.splitEditorRight")
	end, { desc = "Split vertical" })
	keymap.set("n", "<leader>sh", function()
		vscode.call("workbench.action.splitEditorDown")
	end, { desc = "Split horizontal" })
	keymap.set("n", "<leader>se", function()
		vscode.call("workbench.action.evenEditorWidths")
	end, { desc = "Split equal" })
	keymap.set("n", "<leader>sx", function()
		vscode.call("workbench.action.closeEditorsInGroup")
	end, { desc = "close the split" })

	local explorer_visible = false
	keymap.set("n", "<leader>ee", function()
		if explorer_visible then
			-- Close explorer and focus editor
			vscode.call("workbench.action.closeSidebar")
			explorer_visible = false
		else
			-- Open explorer and focus it
			vscode.call("workbench.view.explorer")
			vscode.call("workbench.action.focusSideBar")
			explorer_visible = true
		end
	end, { desc = "Toggle Explorer (open/close + focus)" })

	local search_visible = false
	keymap.set("n", "<leader>fa", function()
		if search_visible then
			-- Close search and focus editor
			vscode.call("workbench.action.closeSidebar")
			search_visible = false
		else
			-- Open search and focus it
			vscode.call("workbench.action.findInFiles")
			search_visible = true
		end
	end, { desc = "Toggle Find in Files" })

	--buffer keymaps
	keymap.set("n", "<leader>bo", function()
		vscode.call("workbench.action.files.newUntitledFile")
	end, { desc = "Open a new file" }) -- New file
	keymap.set("n", "<leader>bx", function()
		vscode.call("workbench.action.closeActiveEditor")
	end, { desc = "Close current editor" }) -- Close current editor
	keymap.set("n", "<leader>bn", function()
		vscode.call("workbench.action.nextEditor")
	end, { desc = "Go to next editor" }) -- Next editor
	keymap.set("n", "<leader>bp", function()
		vscode.call("workbench.action.previousEditor")
	end, { desc = "Go to previous editor" }) -- Previous editor
	keymap.set("n", "<leader>bb", function()
		vscode.call("workbench.action.showAllEditors")
	end, { desc = "Show all editors" }) -- List all editors

	-- Navigation with VS Code commands
	keymap.set("n", "\\", function()
		vscode.call("workbench.action.nextEditor")
	end, { desc = "Go to next editor" })
	keymap.set("n", "|", function()
		vscode.call("workbench.action.previousEditor")
	end, { desc = "Go to previous editor" })

	-- For buffer picking, you might need a VS Code extension like "Quick Open" or use built-in
	keymap.set("n", "<leader>fo", function()
		vscode.call("workbench.action.quickOpen")
	end, { desc = "Quick open files" }) -- Quick open

	-- Make `0` go to the end of the line
	keymap.set("", "0", "$", { desc = "Go to the end of the line" })

	-- Make `1` go to the start of the line
	keymap.set("", "`", "0", { desc = "Go to the start of the line" })

	--Find and Replace
	-- keymap.set("n", "<leader>ff", function() vscode.call("actions.find") end, { desc = "Find (VS Code)" })
	-- keymap.set("n", "<leader>rr", ":%s///g<Left><Left><Left>", { desc = "Find and Replace" })
	keymap.set("n", "<leader>rr", function()
		vscode.call("editor.action.startFindReplaceAction")
	end, { desc = "Find and Replace (VS Code)" })

	-- Format document
	keymap.set("n", "<leader>mp", function()
		vscode.call("editor.action.formatDocument")
	end, { desc = "Format document" })

	-- Format selection
	keymap.set("v", "<leader>ml", function()
		vscode.call("editor.action.formatSelection")
	end, { desc = "Format selection" })

	-- Prevent c motions from yanking into clipboard
	-- vim.keymap.set("n", "c", '"_c', { noremap = true, desc = "Change without yanking" })
	-- vim.keymap.set("n", "C", '"_C', { noremap = true, desc = "Change till end of line without yanking" })
	-- vim.keymap.set("x", "c", '"_c', { noremap = true, desc = "Change selection without yanking" })
end
