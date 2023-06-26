local status, builtin = pcall(require, "telescope.builtin")
if not status then
    return
end

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
-- Preview file in a floating window
vim.keymap.set("n", "<leader>o", function()
    local selection = require("telescope.state").get_
    -- Windows Method
    vim.fn.jobstart("ii " .. selection.path)
end)
