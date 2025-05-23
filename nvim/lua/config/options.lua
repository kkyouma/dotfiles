local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
-- opt.title = true
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = ''
opt.signcolumn = 'yes'
opt.cmdheight = 0
opt.showcmd = false
opt.laststatus = 1
opt.scrolloff = 10
opt.completeopt = 'menuone,noinsert,noselect'
opt.list = true -- withespace characters
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.inccommand = 'split' -- Preview substitutions
opt.cursorline = true -- Show which line the cursor is on

-- Behaivour
opt.updatetime = 250 -- Decrease update time
opt.timeoutlen = 300 -- Decrease mapped sequence wait time
opt.breakindent = true
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.backspace = { 'start', 'eol', 'indent' }
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append '-'
opt.mouse:append 'a'
opt.modifiable = true
opt.encoding = 'UTF-8'
opt.shell = 'zsh'

opt.pumheight = 3 -- limit completion items
opt.fillchars = { eob = ' ' } -- replace the `~` for blank spaces
