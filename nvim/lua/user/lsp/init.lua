local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.configs"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

local ll_status_ok, lsplines = pcall(require, "lsp_lines")
if not ll_status_ok then
  return
end

lsplines.setup()
