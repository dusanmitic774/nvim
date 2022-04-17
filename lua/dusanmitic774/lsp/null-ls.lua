local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions


null_ls.setup({
    debug = false,
    sources = {
        formatting.stylua,
        formatting.black,
        formatting.autopep8,
        formatting.prettier.with({
            filetypes = {"javascript"}
        }),
        diagnostics.eslint_d,
        diagnostics.pylint,
        code_actions.eslint_d,
    },
})
