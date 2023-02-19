for opt, val in pairs({
	backspace = "indent,eol,start",
	breakindent = true,
	clipboard = "unnamed",
	completeopt = "menuone,noselect,menu",
	conceallevel = 3,
	cursorline = true,
	cursorlineopt = "number",
	diffopt = "internal,filler,closeoff,algorithm:patience",
	expandtab = true,
	fillchars = "fold: ,foldclose:,foldopen:,foldsep: ,diff: ,eob: ",
	fixendofline = false,
	foldexpr = "nvim_treesitter#foldexpr()",
	foldlevel = 99,
	foldmethod = "expr",
	formatoptions = "l",
	ignorecase = true,
	inccommand = "split",
	laststatus = 3,
	linebreak = true,
	mouse = "a",
	number = true,
	pumheight = 12,
	relativenumber = false,
	scrolloff = 10,
	shiftwidth = 0,
	showmode = false,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	switchbuf = "useopen",
	tabstop = 2,
	termguicolors = true,
	textwidth = 120,
	undodir = vim.fn.expand("~/.cache/nvim/undodir"),
	undofile = true,
	viewoptions = "cursor,folds,slash,unix",
	wrap = false,
}) do
	vim.opt[opt] = val
end

local disabled_build_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_build_ins) do
	vim.g["loaded_" .. plugin] = 1
end

vim.opt.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
