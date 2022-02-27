local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require('dusanmitic774.lsp.lsp-installer')
require("dusanmitic774.lsp.handlers").setup()
require('dusanmitic774.lsp.null-ls')
