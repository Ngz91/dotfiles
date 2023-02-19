return {
	settings = {
		Lua = {
			type = {
				-- weakUnionCheck = true,
				-- weakNilCheck = true,
				-- castNumberToInteger = true,
			},
			hint = {
				enable = true,
				arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
				await = true,
				paramName = "Disable", -- "All", "Literal", "Disable"
				paramType = true,
				semicolon = "Disable", -- "All", "SameLine", "Disable"
				setType = true,
			},
			-- spell = {"the"}
			runtime = {
				version = "LuaJIT",
				special = {
					include = "reload",
				},
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
					-- [vim.fn.datapath "config" .. "/lua"] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
