-- Setup nvim-cmp.
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end

npairs.setup {
    check_ts = true,
    ts_config = {
        lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    enable_check_bracket_line = false,
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
    enable_moveright = true,
    ---@usage disable when recording or executing a macro
    disable_in_macro = false,
    ---@usage add bracket pairs after quote
    enable_afterquote = true,
    ---@usage map the <BS> key
    map_bs = true,
    ---@usage map <c-w> to delete a pair if possible
    map_c_w = false,
    ---@usage disable when insert after visual block mode
    disable_in_visualblock = false,
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        -- highlight = "PmenuSel",
        -- highlight_grey = "LineNr",
        highlight = "Search",
        highlight_grey = "Comment",
        },
}

-- this will integrate autopairs with cmp and auto add brackets after completion
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

