local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- -- NERDTREE --
-- keymap("n", "<C-t>", ":NERDTreeToggle<CR>", opts)
-- keymap("n", "<C-t>", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>fg", ":Telescope git_files<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader><leader>", ":Telescope file_browser<CR>", opts)

-- terminal --
keymap("n", "<leader>g", ":lua _LAZYGIT_TOGGLE()<CR>", opts)

-- -- neoterm --
-- -- escape insert mode in terminal
-- keymap("t", "<Esc>", "<C-><C-n>", opts)
-- -- send current line and move down
-- keymap("n", "<leader><cr>", ":TREPLSendLine<cr>j", opts)
-- -- send current selection
-- keymap("v", "<leader><cr>", ":TREPLSendSelection<cr>", opts)
-- -- python run mapping
-- keymap("n", "<leader>r", ":T python %<cr>", opts)
