local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	-- colorscheme
    -- use 'ful1e5/onedark.nvim'
    use 'morhetz/gruvbox'

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("williamboman/mason.nvim") -- LSP, DAP, linter, & formatter installation
	use("williamboman/mason-lspconfig.nvim") -- integrates mason with nvim-lspconfig
	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
	use("mfussenegger/nvim-dap") -- DAP
	use("jose-elias-alvarez/null-ls.nvim") -- linting and formatting

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- -- statusline
	-- use 'itchyny/lightline.vim'

	-- -- file explorer
	-- use 'scrooloose/nerdtree'

	-- -- fuzzy finder
	-- use {
	--     'junegunn/fzf',
	--     run = 'call fzf#install()'
	-- }
	-- use 'junegunn/fzf.vim'

	-- use {
	--     'neoclide/coc.nvim',
	--     branch = 'release'
	-- }

	-- use 'tpope/vim-fugitive'
	-- use 'tpope/vim-surround'
	-- use 'tpope/vim-commentary'
	-- use 'tpope/vim-unimpaired'
	-- use 'tpope/vim-repeat'
	-- use 'kassio/neoterm'
	-- use 'vimwiki/vimwiki'
	-- use {
	--     'windwp/nvim-autopairs',
	--     config = function()
	--         require('nvim-autopairs').setup {}
	--     end
	-- }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
