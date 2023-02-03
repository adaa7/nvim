local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }
local pluginKeys = {}

--leap光标移动插件

require('leap').opts.highlight_unlabeled_phase_one_targets = true
vim.keymap.set({'x', 'o', 'n'}, 'f', '<Plug>(leap-forward-to)')
vim.keymap.set({'x', 'o', 'n'}, 'F', '<Plug>(leap-backward-to)')
vim.keymap.set({'x', 'o', 'n'}, 'gf', '<Plug>(leap-cross-window)')

map("n", "<C-n>", "<ESC>:w<CR>:split<CR>:te gcc -std=c11 -Wshadow -Wall -o %:t:r.out % -g  && time ./%:t:r.out<CR>i", opt)
-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}
return pluginKeys


