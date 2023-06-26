local status, refactoring = pcall(require, "refactoring")
if not status then
    return
end

refactoring.setup({})

vim.api.nvim_set_keymap(
    "v",
    "<leader>ri",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false }
)
