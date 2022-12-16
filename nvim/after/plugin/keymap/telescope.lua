local Remap = require("chiko.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", ":Telescope")
nnoremap("<leader>ps", function()
    -- require('telescope.builtin').live_grep({ grep_open_files = false })
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)
nnoremap("<Leader>pf", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)

-- TODO: Fix this immediately
nnoremap("<leader>vwh", function()
    require('telescope.builtin').help_tags()
end)

nnoremap("<leader>vrc", function()
    require('chiko.telescope').search_dotfiles({ hidden = true })
end)
nnoremap("<leader>va", function()
    require('chiko.telescope').anime_selector()
end)
nnoremap("<leader>vc", function()
    require('chiko.telescope').chat_selector()
end)
nnoremap("<leader>gc", function()
    require('chiko.telescope').git_branches()
end)
nnoremap("<leader>gw", function()
    require('telescope').extensions.git_worktree.git_worktrees()
end)
nnoremap("<leader>gm", function()
    require('telescope').extensions.git_worktree.create_git_worktree()
end)
nnoremap("<leader>td", function()
    require('chiko.telescope').dev()
end)
