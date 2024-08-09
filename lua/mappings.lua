require "nvchad.mappings"
local opts = { noremap = true, silent = true }

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map({ "n", "i", "v" }, "<C-z>", "<cmd> u <cr>")
map({ "n", "i", "v" }, "<C-y>", "<cmd> redo <cr>")

-- Enter insert mode with backspace when in normal mode
map("n", "<BS>", "i", opts)

-- Yank to system clipboard with Ctrl+C and Ctrl+X in visual mode
map("v", "<C-c>", '"+yi', { silent = true })
map("v", "<C-x>", '"+c', { silent = true })

-- Paste from system clipboard with Ctrl+V in any mode
map({ "n", "v" }, "<C-S-v>", 'c<ESC>"+p', { silent = true })
map("i", "<C-v>", "<C-r><C-o>+", { silent = true })

-- Select all
map("n", "<C-a>", "ggVG", { silent = true })
map("v", "<C-a>", "ggVG", { silent = true })
map("i", "<C-a>", "<Esc>ggVG", { silent = true })

-- Close tab with CTRL+W
map("n", "<C-A-w>", "<cmd> bdelete <cr>", { noremap = true })

-- Close Nvim with CTRL+X
map({"n", "i"}, "<C-x>", "<cmd> q <cr>", { noremap = true })
map({"n", "i"}, "<C-X>", "<cmd> quitall! <cr>", { noremap = true })

--Telescope
local tbuiltin = require('telescope.builtin')
-- Fuzzy Finder with Ctrl+P, like VSCode
map({"n", "i"}, "<C-p>", tbuiltin.find_files, {})
-- Searches for the string under your cursor or selection in your current working directory
map({"n", "i"}, "<C-f>", tbuiltin.current_buffer_fuzzy_find, {})
map({"n", "i"}, "<C-A-f>", tbuiltin.live_grep, {})

local M = {}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line"
		},
		["<leader>dus"] = {
			function ()
				local widgets = require("dap.ui.widgets");
				local sidebar = widgets.sidebar(widgets.scopes);
				sidebar.open();
			end,
			"Open debugging sidebar"
		},
	},
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require("dap-go").debug_test();
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function ()
        require("dap-go").debug_last();
      end,
      "Debug last go test"
    },
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}

return M
