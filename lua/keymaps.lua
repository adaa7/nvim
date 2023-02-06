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

-- debug
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint(); require'dap.dap-util'.store_breakpoints(true)<cr>", opt)
map("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opt)
-- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
map("n", "<F9>", "<cmd>lua require'dap'.run_last()<cr>", opt)
map('n', '<F10>', '<cmd>lua require"dap.dap-util".reload_continue()<CR>', opt)
map("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opt)
map("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opt)
map("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opt)
map("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opt)
map("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opt)
map("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opt)
-- keymap("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)

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


