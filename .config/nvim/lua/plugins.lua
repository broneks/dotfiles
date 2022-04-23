local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'mhinz/vim-startify'

  -- Prettier
  -- post install (yarn install | npm install) then load plugin only for editing supported files
  use {
    'prettier/vim-prettier',
    run = 'yarn install',
    ft = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'scss', 'json', 'markdown', 'yaml', 'html', 'graphql', 'lua'}
  }

  -- Syntax 
  use 'sheerun/vim-polyglot'

  -- Graphql
  use 'jparise/vim-graphql'

  -- Search
  use 'BurntSushi/ripgrep'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
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

  -- Theme
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'EdenEast/nightfox.nvim'
  use 'NLKNguyen/papercolor-theme'

  -- File tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Git
  use 'tpope/vim-fugitive'
  use 'kdheepak/lazygit.nvim'

  -- Comments
  use 'tpope/vim-commentary'

  -- HTML
  use 'tpope/vim-ragtag'

  -- Registers
  use {
    'tversteeg/registers.nvim',
    branch = 'main'
  }

  -- Buffers
  use 'Asheq/close-buffers.vim'

  -- Harpoon
  use {
    'ThePrimeagen/harpoon',
    requires = {'nvim-lua/plenary.nvim'}
  }

  -- Helping hand
  use {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup {}
    end
  }

  -- Intellisense
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
