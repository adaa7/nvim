" 配置文件导入 
"---------------------------------------------------------------------
" 基础使用习惯配置
runtime vimrc.vim
" 插件管理
"./lua/plugins.lua
lua require('plugins')
lua require('nvim-tree')
lua require('dashboard')
"lua require('nvim-lastplace')
lua require('dap.dap-run')
" 按键映射 
runtime ./maps.vim
"加载优先级
"状态栏
source ~/.config/nvim/after/plugin/airline.rc.vim
"主题
source ~/.config/nvim/colors/gruvbox_material.rc.vim
"彩虹括号
source ~/.config/nvim/after/plugin/rainbow.rc.vim
