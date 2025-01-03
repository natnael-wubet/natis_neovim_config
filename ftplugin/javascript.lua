-- Custom function to provide suggestions for '../' completions
local function suggest_relative_paths(line, col)
    local word_before_cursor = vim.fn.expand("<cword>")
    local line_number = vim.fn.line(".")
    local start_pos = math.max(col - 1, 1)
    local stop_pos = math.min(math.huge, #vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[0])
    local search_range = string.format("%d/%d", start_pos, stop_pos)
    local base_directory = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h")
    local candidates = {}

    -- Find directories starting from the parent folder
    local dir_iter = vim.loop.fs_scandir(base_directory)
    while true do
        local name, _type = dir_iter()
        if not name then break end

        local full_path = base_directory .. "/" .. name
        if vim.fn.isdirectory(full_path) then
            table.insert(candidates, full_path .. "/")
        end
    end

    -- Filter candidates based on the provided input
    for _, candidate in ipairs(candidates) do
        if string.match(candidate, "^" .. word_before_cursor) then
            table.insert(candidates, candidate)
        end
    end

    return candidates
end

-- Configure omnicomplete settings for javascript files
-- vim.bo[vim.api.nvim_create_augroup("JavaScriptOmniComplete", {})].omnifunc = "v:lua.suggest_relative_paths"
-- Create a new augroup named "JavaScriptOmniComplete"
-- local javascriptAutocompleteGrpName = "JavaScriptOmniComplete"
-- vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
--     group = javascriptAutocompleteGrpName,
--     pattern = "*.js",
--     callback = function ()
--         -- Override default omnifunc with our custom suggestion function
--         local currentBuffer = vim.api.nvim_get_current_buffer()
--         vim.bo[currentBuffer].omnifunc = "v:lua.suggest_relative_paths"
--     end,
-- })
--
-- -- Create custom mapping for triggering omnicompletion at '.' character after '../'
-- vim.keymap.set("i", "(..)\\.", function()
--     vim.cmd [[normal! o]]
--     vim.opt_local.completeopt = {"menuone", "noinsert"}
--     vim.fn["cmp#complete"]()
--     vim.opt_local.completeopt = {"menu", "preview"}
-- end, {expr=true})
