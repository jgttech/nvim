local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true
opt.nu = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
vim.opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- cursor line
opt.cursorline = true
opt.scrolloff = 8

-- appearance
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true
opt.splitbelow = true

-- turn off swapfile
opt.swapfile = false
opt.backup = false

-- update options
vim.opt.updatetime = 50
vim.g.editorconfig = true

-- disable mouse
vim.opt.mouse = ""