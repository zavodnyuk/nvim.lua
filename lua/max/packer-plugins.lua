-- plug.nvim use 'packages' to load itself up. To load plug.nvim through
--   'runtimepath', change 2 lines below to this instead
--
--   local config_home = vim.fn.stdpath('config')
--   local plug_path = config_home .. '/lua/plug.lua'
local pack_site = vim.fn.stdpath('data') .. '/site/pack'
local plug_path = pack_site .. '/plug/start/plug.nvim/lua/plug.lua'
local plug_url = 'https://raw.githubusercontent.com/spywhere/plug.nvim/main/plug.lua'

if vim.fn.filereadable(vim.fn.expand(plug_path)) == 0 then
  if vim.fn.executable('curl') == 0 then
    -- curl not installed, skip the config
    print('cannot install plug.nvim, curl is not installed')
    return
  end
  vim.cmd(
    'silent !curl -fLo ' .. plug_path .. ' --create-dirs ' .. plug_url
  )
  -- only required if you have plug.nvim configured as 'start'
  --   since with 'opt' you would have to do the same every time as below
  vim.cmd('packadd! plug.nvim')
end

local plug = require ('plug')

plug.setup({
	backend = plug.backend.lazy {},
	extensions = {
		plug.extension.requires{},
		plug.extension.config{},
		plug.extension.priority{
			priority = ''
		},
		plug.extension.auto_install {},
	},
}, function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim',

		requires = { {'nvim-lua/plenary.nvim'} },
		options = {
			tag = '0.1.1',
			-- or                            , branch = '0.1.x',
		}
	}
	use {
		'folke/todo-comments.nvim',
		requires = {'nvim-lua/plenary.nvim' },
	}
	use ({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
	use {
		'nvim-treesitter/nvim-treesitter',
		options = {
			run = ':TSUpdate'
		}
	}
	use {
		"folke/lsp-trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	}
	use 'kevinhwang91/nvim-bqf'
	use 'github/copilot.vim'
	use 'mbbill/undotree'
	use 'airblade/vim-gitgutter'

	use 'wakatime/vim-wakatime'
	use "lukas-reineke/indent-blankline.nvim"
	use "Darazaki/indent-o-matic"
	use 'kien/rainbow_parentheses.vim' -- Probably does not work
	use ({'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }})

	use({ 'rose-pine/neovim', 
		options = {
			as = 'rose-pine',
		},
		config = function()
			--	use 'audibleblink/hackthebox.vim'
			vim.cmd('colorscheme habamax')
		end
	})
	-- FIXME: This one does not show bars
	use({
		"utilyre/barbecue.nvim",
		options = {
			tag = "*",
		},
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		after = "nvim-web-devicons",
		config = function()
			require("barbecue").setup()
		end,
	})
	use 'mhinz/vim-startify'
	use 'KabbAmine/yowish.vim'

	use 'tpope/vim-fugitive'
	use {                                      -- Optional
		'williamboman/mason.nvim',
		options = {
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
	}
	use {
		'VonHeikemen/lsp-zero.nvim',
		options = {
			branch = 'v2.x',
		},
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{ 'williamboman/mason.nvim' },                  -- Optional

		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	}
}
end)
