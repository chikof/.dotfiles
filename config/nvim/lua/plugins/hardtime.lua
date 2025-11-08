return {
    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            disabled_keys = {
                ["<Up>"] = false,   -- allow Up key
                ["<Down>"] = false, -- allow Down key
            },
        },
    },
}
