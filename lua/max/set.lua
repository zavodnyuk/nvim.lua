vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.hidden = true


vim.opt.smartindent = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim.undodir"
vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.backup = false

vim.opt.hlsearch = true 
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.colorcolumn = "100"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.ignorecase = true
vim.opt.updatetime = 400
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
