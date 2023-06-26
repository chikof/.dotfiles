local status, comment = pcall(require, "Comment")
if not status then
    return
end

comment.setup({
    ignore = "^$",
    toggler = {
        line = "<leader>cc",
        block = "<leader>bc",
    },
    opleader = {
        line = "<leader>c",
        block = "<leader>b",
    },
})
