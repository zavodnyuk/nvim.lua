vim.keymap.set("n", "nt", vim.cmd.NERDTreeToggle)
vim.cmd([[
  augroup NvimConfig
    autocmd!
    autocmd VimEnter * if !argc() | Startify | NERDTree | wincmd w | endif
  augroup END
]])

