return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  --vim-airline状态栏
  use {
        "vim-airline/vim-airline",
        requires = {
          "vim-airline/vim-airline-themes",
          --综合图标支持such vim-airline lightline, vim-startify
          "ryanoasis/vim-devicons" }
  }
  -- nvim-tree
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
 -- 文件搜索 预览 等
use {
	"nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons"
    }
}
-- 加速文件搜索速度,如果安装失败需要到插件目录执行make命令手动编译
-- 用了这个插件以后，貌似更快了(感觉输入更跟手了，可能是心理作用)。
use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"} 

-- 显示css的颜色代码的颜色
use "ap/vim-css-color"
-- 符号自动匹配，比如：输入(自动闭合）
use "windwp/nvim-autopairs"
--语法高亮
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
--彩虹括号
use 'luochen1990/rainbow'
--注释插件
use "b3nj5m1n/kommentary"

--开场UI
use("glepnir/dashboard-nvim")
--jsx注释
use "JoosepAlviste/nvim-ts-context-commentstring"
  -- indent-blankline
use("lukas-reineke/indent-blankline.nvim")
use("tami5/lspsaga.nvim" ) -- 新增
--跳行
use 'ggandor/leap.nvim'




------------------------------------------
---------------LSP------------------------
------------------------------------------
  --Nvim LSP 客户端的快速入门配置
use 'williamboman/nvim-lsp-installer'
use { "williamboman/mason.nvim" }
use "neovim/nvim-lspconfig"
use {
"hrsh7th/nvim-cmp",
requires = {
"hrsh7th/cmp-nvim-lsp", --neovim 内置 LSP 客户端的 nvim-cmp 源
--以下插件可选，可以根据个人喜好删减
"onsails/lspkind-nvim", --美化自动完成提示信息
"hrsh7th/cmp-buffer", --从buffer中智能提示
"hrsh7th/cmp-nvim-lua", --nvim-cmp source for neovim Lua API.
"octaltree/cmp-look", --用于完成英语单词
"hrsh7th/cmp-path", --自动提示硬盘上的文件
"hrsh7th/cmp-calc", --输入数学算式（如1+1=）自动计算
"f3fora/cmp-spell", --nvim-cmp 的拼写源基于 vim 的拼写建议
"hrsh7th/cmp-emoji", --输入: 可以显示表情
}
}
-- 自动为尚不支持 Neovim 0.5 内置 lsp 客户端的配色方案创建缺少的 LSP 诊断突出显示组。
use "folke/lsp-colors.nvim"
-- 基于neovim 内置lsp 的轻量级lsp 插件，具有高性能UI。非常酷
use 'rinx/lspsaga.nvim'

-- 代码段提示
use {
"L3MON4D3/LuaSnip",
requires = {
"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
"rafamadriz/friendly-snippets" --代码段合集
}
}



	
  ---------------------------------------------------
  -------Colorscheme---------------------------------
  ---------------------------------------------------
  use "sainnhe/gruvbox-material"


 end)
