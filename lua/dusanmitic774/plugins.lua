-- Automatically install packer

-- fn.stdpath "data" points to /home/shinobi/.local/share/nvim
-- this is where all the plugins go
-- checks if packer is installed, if not it pulls it from git and installs
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone", "--depth", "1",
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

-- normal way to require packer and save it in a local variable
-- local packer = require("packer")

-- Use a protected call so we don't error out on first use
-- pcall is protected call and it will either give us
-- packer instance or an error that we save in status_ok
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	-- we can do vim.notify here
	vim.notify("there was an error requiring packer")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- EVERYTHING UP TO HERE JUST SETS PACKER TO RUN AUTOMATICALY

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("folke/which-key.nvim")
	use("akinsho/bufferline.nvim")
	use("tpope/vim-surround")
    use("tpope/vim-repeat")
	use("lewis6991/gitsigns.nvim")
	use("nvim-lualine/lualine.nvim")
	use("lewis6991/impatient.nvim")

    -- Colorschemes
	use("mhartington/oceanic-next")
    use("whatsthatsmell/codesmell_dark.vim")

    -- CMP completions
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	-- use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- gives completions for lsp

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- Telescope
	use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-fzy-native.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("JoosepAlviste/nvim-ts-context-commentstring")
    use("moll/vim-bbye")

    -- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
    use('tamago324/nlsp-settings.nvim')

    -- Formatters and Linters
    use("jose-elias-alvarez/null-ls.nvim")

    use("akinsho/toggleterm.nvim")
    -- use 'voldikss/vim-floaterm'

    use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

    use "ray-x/lsp_signature.nvim"

    -- Debugging
    use 'mfussenegger/nvim-dap'
    use "rcarriga/nvim-dap-ui"

    use "szw/vim-maximizer"


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

