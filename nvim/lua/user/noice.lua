local status_ok, noice = pcall(require, "noice")
if not status_ok then
	return
end

noice.setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		progress = {
			enabled = false,
		},
		hover = {
			enabled = false,
		},
		signature = {
			enabled = false,
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = false, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
	signature = {
		enabled = true,
		auto_open = {
			enabled = true,
			trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
			luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
			throttle = 50, -- Debounce lsp signature help request by 50ms
		},
		view = nil, -- when nil, use defaults from documentation
		opts = {}, -- merged with defaults from documentation
	},
	notify = {
		-- Noice can be used as `vim.notify` so you can route any notification like other messages
		-- Notification messages have their level and other properties set.
		-- event is always "notify" and kind can be any log level as a string
		-- The default routes will forward notifications to nvim-notify
		-- Benefit of using Noice for this is the routing and consistent history view
		enabled = false,
		view = "notify",
	},
	messages = {
		enabled = true,
	},
})
