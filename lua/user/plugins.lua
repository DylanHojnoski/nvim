local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.g.mapleader = " "
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	'nvim-lua/plenary.nvim',
	'nvim-treesitter/nvim-treesitter',
	'nvim-telescope/telescope.nvim', tag = '0.1.1',
	'ThePrimeagen/harpoon',
	'jiaoshijie/undotree',
	'tpope/vim-fugitive',
	'sainnhe/everforest',

	'VonHeikemen/lsp-zero.nvim',
	branch = 'v1.x',
		-- LSP Support
	{'neovim/nvim-lspconfig'},             -- Required
	{'williamboman/mason.nvim'},           -- Optional
	{'williamboman/mason-lspconfig.nvim'}, -- Optional

	-- Autocompletion
	{'hrsh7th/nvim-cmp'},         -- Required
	{'hrsh7th/cmp-nvim-lsp'},     -- Required
	{'hrsh7th/cmp-buffer'},       -- Optional
	{'hrsh7th/cmp-path'},         -- Optional
	{'saadparwaiz1/cmp_luasnip'}, -- Optional
	{'hrsh7th/cmp-nvim-lua'},     -- Optional
    "windwp/nvim-autopairs",

	-- Snippets
	{'L3MON4D3/LuaSnip'},             -- Required
	{'rafamadriz/friendly-snippets'}, -- Optional

    -- Debug
    'mfussenegger/nvim-dap',

    'ahmedkhalf/project.nvim',
    'nvim-lualine/lualine.nvim',
}

local opts = {}

require("lazy").setup(plugins, opts)