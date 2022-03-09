local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'mhinz/vim-startify'

  -- Music
  -- use {
  --   'srishanbhattarai/neovim-spotify',
  --   run = 'bash install.sh'
  -- }

  -- Search and replace
  -- use 'brooth/far.vim'

  -- Prettier
  -- post install (yarn install | npm install) then load plugin only for editing supported files
  use {
    'prettier/vim-prettier',
    run = 'yarn install',
    ft = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'scss', 'json', 'markdown', 'yaml', 'html', 'graphql', 'lua'}
  }

  -- Typescript
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
  use 'tami5/sqlite.lua'
  use 'nvim-telescope/telescope-frecency.nvim'

  -- Theme
  use 'ajmwagar/vim-deus'
  use 'folke/zen-mode.nvim'
  use 'itchyny/lightline.vim'
  use 'EdenEast/nightfox.nvim'
  use 'NLKNguyen/papercolor-theme'
  use 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
  use 'kyazdani42/nvim-web-devicons'

  -- File tree
  use 'scrooloose/nerdtree'
  use 'antoinemadec/FixCursorHold.nvim'
  use 'preservim/nerdcommenter'

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

  -- Intellisense
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }

  -- Buffers
  use 'Asheq/close-buffers.vim'

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
