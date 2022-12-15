local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
  -- Plugin manager
  use 'wbthomason/packer.nvim'

  -- Startup
  use 'mhinz/vim-startify'
  use 'lewis6991/impatient.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- File tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    tag = 'nightly',
  }

  -- Search
  use 'BurntSushi/ripgrep'
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }

  -- Registers
  use 'tversteeg/registers.nvim'

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Comments
  use 'tpope/vim-commentary'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Colors
  use 'ap/vim-css-color'

  -- LSP Intellisense
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Prettier
  -- post install (yarn install | npm install) then load plugin only for editing supported files
  use {
    'prettier/vim-prettier',
    run = 'yarn install',
    ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'css',
      'scss',
      'json',
      'markdown',
      'yaml',
      'html',
      'graphql',
      'lua',
      'vue',
    }
  }

  -- Git
  use 'tpope/vim-fugitive'
  use 'kdheepak/lazygit.nvim'
  use 'lewis6991/gitsigns.nvim'

  -- HTML
  use 'tpope/vim-ragtag'

  -- Markdown 
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  }

  -- Stylus
  use 'ChiliConSql/neovim-stylus'

  -- Test and Debug
  use 'mfussenegger/nvim-dap'
  use {
    'rcarriga/nvim-dap-ui',
    requires = {'mfussenegger/nvim-dap'}
  }
  use 'David-Kunz/jester'

  -- Harpoon
  use {
    'ThePrimeagen/harpoon',
    requires = {'nvim-lua/plenary.nvim'}
  }

  -- Toggle values
  use 'AndrewRadev/switch.vim'
  use 'gerazov/vim-toggle-bool'

  -- Utility
  use 'windwp/nvim-autopairs'
  use {
    'Wansmer/treesj',
    requires = { 'nvim-treesitter' },
  }
  use {
    'kylechui/nvim-surround',
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  }

  -- Note
  use 'vimwiki/vimwiki'

  -- Theme
  use 'EdenEast/nightfox.nvim'

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
