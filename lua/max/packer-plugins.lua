vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use {
		"folke/lsp-trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	}
	use 'kevinhwang91/nvim-bqf'
	use 'github/copilot.vim'
	use 'mbbill/undotree'
	use 'airblade/vim-gitgutter'

	use 'wakatime/vim-wakatime' -- Probably does not work
	use 'Yggdroot/indentLine'
	use 'kien/rainbow_parentheses.vim' -- Probably does not work
	use ({'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }})

	use({ 'rose-pine/neovim', as = 'rose-pine', config = function()
		--	use 'audibleblink/hackthebox.vim'
		vim.cmd('colorscheme rose-pine')
	end
})
	use 'mhinz/vim-startify'

	use 'tpope/vim-fugitive'
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	}
}
end)
