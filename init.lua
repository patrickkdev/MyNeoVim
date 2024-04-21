require("config.lazy")

-- Auto start insert mode on buffer enter
-- vim.cmd([[autocmd BufEnter * startinsert]])

-- Save file on Ctrl+S in normal, visual, and insert mode
vim.api.nvim_set_keymap("n", "<C-S>", ":update<CR>", { silent = true })
vim.api.nvim_set_keymap("v", "<C-S>", "<C-C>:update<CR>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-S>", "<C-O>:update<CR>", { silent = true })

-- Quit Vim with Ctrl+X in normal and insert mode
vim.api.nvim_set_keymap("n", "<C-x>", ":quit!<CR>", { silent = true })
vim.api.nvim_set_keymap("i", "<C-x>", "<Esc>:quit!<CR>", { silent = true })

-- Yank to system clipboard with Ctrl+C in visual mode
vim.api.nvim_set_keymap("v", "<C-c>", '"+yi', { silent = true })
vim.api.nvim_set_keymap("v", "<C-x>", '"+c', { silent = true })

-- Paste from system clipboard with Ctrl+V in visual and insert mode
vim.api.nvim_set_keymap("v", "<C-v>", 'c<ESC>"+p', { silent = true })
vim.api.nvim_set_keymap("i", "<C-v>", "<C-r><C-o>+", { silent = true })

-- Set clipboard to use system clipboard
vim.o.clipboard = "unnamed"
vim.o.clipboard = "unnamedplus"

-- Undo with Ctrl+Z in normal and insert mode
vim.api.nvim_set_keymap("n", "<c-z>", ":u<CR>", { silent = true })
vim.api.nvim_set_keymap("i", "<c-z>", "<c-o>:u<CR>", { silent = true })

-- Select entire buffer with Ctrl+A in normal mode
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { silent = true })
vim.api.nvim_set_keymap("v", "<C-a>", "ggVG", { silent = true })
vim.api.nvim_set_keymap("i", "<C-a>", "<Esc>ggVG", { silent = true })

-- Jump to the end of the line with Ctrl+Left Arrow in insert and normal
vim.api.nvim_set_keymap("v", "<C-Right>", "$a", { silent = true })
vim.api.nvim_set_keymap("i", "<C-Right>", "<Esc>$a", { silent = true })

-- Jump to the start of the line with Ctrl+Right Arrow in insert and normal mode
vim.api.nvim_set_keymap("v", "<C-Left>", "0i", { silent = true })
vim.api.nvim_set_keymap("i", "<C-Left>", "<Esc>0i", { silent = true })

-- Multi-cursor functionality with Ctrl+Alt+Arrow in insert mode
vim.api.nvim_set_keymap("i", "<C-ArrowUp>", "<Esc>m`o<Esc>``i", { silent = true })
vim.api.nvim_set_keymap("i", "<C-ArrowDown>", "<Esc>m`o<Esc>``i", { silent = true })

-- Disable Ctrl+S and Ctrl+Q key flow control
vim.cmd([[silent !stty -ixon]])
