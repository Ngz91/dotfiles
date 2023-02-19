local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+ ", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["a"] = { "<cmd>Alpha<cr>", " Alpha" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"﬘ Buffers",
	},
	["e"] = { "<cmd>NvimTreeToggle<cr>", " Explorer" },
	["w"] = { "<cmd>w!<CR>", " Save" },
	["q"] = { "<cmd>q!<CR>", " Quit" },
	["c"] = { "<cmd>Bdelete!<CR>", " Close Buffer" },
	["h"] = { "<cmd>nohlsearch<CR>", " No Highlight" },
	["f"] = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		" Find files",
	},
	["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", " Find Text" },
	["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", " Projects" },
	["r"] = { "<cmd>:set number relativenumber!<cr>", " Relative numbers" },
	["C"] = { "<cmd>PickColor<cr>", " Color picker" },
	["v"] = { "<cmd>vsplit<cr>", " Vsplit" },
	["H"] = { "<cmd>split<cr>", " Hsplit" },

	p = {
		name = " Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = " Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},
	d = {
		name = "爵 Django",
		s = { "<cmd>lua _DJANGO_STARTPROJECT()<CR>", "Start project" },
		a = { "<cmd>lua _DJANGO_CREATEAPP()<cr>", "Create App" },
		r = { "<cmd>lua _DJANGO_RUNSERVER()<cr>", "Run django server" },
		d = { "<cmd>lua _DJANGO_DB_SHELL()<cr>", "DB Shell" },
		t = { "<cmd>lua _DJANGO_SHELL()<cr>", "Django Shell" },
		F = { "<cmd>lua _DJANGO_FLUSH()<cr>", "Flush DB" },
	},

	D = {
		name = " Python debugging",
		t = { "<cmd>DapToggleBreakpoint<cr>", "Toggle" },
		c = { "<cmd>DapContinue<cr>", "Continue" },
		k = { "<cmd>DapTerminate<cr>", "Terminate" },
		l = { "<cmd>DapShowLog<cr>", "Log" },
	},

	l = {
		name = " LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			"<cmd>Telescope lsp_document_diagnostics<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>Mason<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		v = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Virtual text" },
		h = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Toggle Inlayhints" },
		R = { "<cmd>lua require('lsp-inlayhints').reset()<cr>", "Reset Inlayhints" },
		o = { "<cmd>SymbolsOutline<cr>", "Toggle Symbols Outline" },
	},
	s = {
		name = " Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		f = { "<cmd>Telescope lsp_references<cr>", "Find References" },
		d = { "<cmd>Telescope lsp_definitions<cr>", "Find definitions" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
	},
	S = {
		name = " LspSaga",
		f = { "<cmd>Lspsaga lsp_finder<cr>", "Finder" },
		h = { "<cmd>Lspsaga hover_doc<cr>", "Hover Doc" },
		s = { "<cmd>Lspsaga signature_help<cr>", "Signature Help" },
		p = { "<cmd>Lspsaga preview_definition<cr>", "Preview Def" },
		r = { "<cmd>Lspsaga rename<cr>", "Rename" },
	},
	n = {
		name = "ﭧ Neotest",
		a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
		r = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run current file" },
		d = { "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", "Run nearest test" },
		o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Show error output" },
		s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Toggle test summary" },
		k = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
	},
	m = {
		name = " Pytest",
		p = { "<cmd>lua _PYTEST_TOGGLE()<cr>", "Pytest" },
		r = { "<cmd>lua _PYTES_REPORT_TOGGLE()<cr>", "Pytest report" },
	},
	t = {
		name = " Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
	o = {
		name = "Options",
		c = { "<cmd>lua vim.g.cmp_active = not vim.g.cmp_active<cr>", "Completion On/Off" },
		w = { "<cmd>set wrap!<cr>", "Wrap" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
