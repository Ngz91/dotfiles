local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
	return
end

lspsaga.setup({
	server_filetype_map = {},
	code_action_lightbulb = {
		enable = false,
		sign = false,
		enable_in_insert = false,
		sign_priority = 20,
		virtual_text = false,
	},
})
