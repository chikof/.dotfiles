return {
    {
        "lopi-py/luau-lsp.nvim",
        config = function()
            require("luau-lsp").setup({
                platform = {
                    type = "roblox",
                },
                types = {
                    roblox_security_level = "PluginSecurity",
                },
            })
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
