-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
---@param description string
---@return table
local opts = function(description)
  return { noremap = true, silent = true, desc = description }
end
map("x", "p", "P", opts("fix the stupid behaviour of neovim"))
map("x", "d", '"_d', opts("fix the stupid behaviour of neovim"))
map({ "n", "x" }, "dd", '"_dd', opts("fix the stupid behaviour of neovim"))
map("n", "<leader>j", "j^", opts("goto start of next line"))
map("n", "<leader>J", "j$", opts("goto end of next line"))
map("n", "<leader>k", "k^", opts("goto start of previous line"))
map("n", "<leader>K", "k$", opts("goto end of previous line"))
map("n", "<Esc>", ":q<CR>", opts("Close"))
map("i", "<A-f>", '<C-c>"_dd', opts("Delete Current Line"))
map("n", "<A-f>", '"_dd', opts("Delete Current Line"))
map({ "n", "i" }, "<A-d>", "<cmd>t .<CR>", opts("Copy Line Down"))
-- map("x", "<A-d>", "<cmd>'<,'>t .<CR>", opts("Copy Line Down"))
map("n", "<leader>i", "gg=G", opts("Indent Whole file"))
map("n", "<A-a>", 'ggvG"+y', opts("Select All and copy"))
-- map({ "n", "i" }, "<C-b>", "<PageDown>H0", opts("actual Page down"))
map("n", "<leader>ll", ":Lazy<CR>", opts("Open Lazy.nvim"))
map("n", "<leader>le", ":LazyExtras<CR>", opts("Open LazyVim Extras"))
map("n", "<leader>fN", ":Neotree toggle=true position=current<CR>", opts("Neotree Netrw Style"))
map("n", "<leader>sf", ":%s/original/updated", opts("Substite all in Current file"))
map("n", "<leader>ft", "<cmd>echo &filetype<cr>", opts("Show filetype"))
map("n", "<leader>ut", "<cmd>lua require('undotree').toggle()<cr>", opts("Toggle UndoTree"))
-- function COPY_DOWN()
--   vim.cmd('normal! gv"+ypgv<esc>p')
-- end
--
-- -- Map Alt+D to the function
-- map("v", "<A-d>", ':normal gv"zygv<esc>@z<cr>', opts("Copy Multiple lines down"))
