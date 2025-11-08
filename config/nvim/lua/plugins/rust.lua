local function rust_analyzer_settings()
    local opts = {
        checkOnSave = {
            -- enable = vim.g.lazyvim_rust_diagnostics == "rust-analyzer",
            enable = false,
            command = "clippy",
            extraArgs = { "--no-deps" },
            target = vim.env.NEOVIM_RUST_TARGET,
        },
        callInfo = {
            full = true,
        },
        lens = {
            enable = true,
            references = true,
            implementations = true,
            enumVariantReferences = true,
            methodReferences = true,
        },
        inlayHints = {
            enable = true,
            bindingModeHints = {
                enable = false,
            },
            chainingHints = {
                enable = true,
            },
            closingBraceHints = {
                enable = true,
            },
            closureReturnTypeHints = {
                enable = true,
            },
            lifetimeElisionHints = {
                enable = false,
                useParameterNames = true,
            },
            parameterHints = {
                enable = true,
            },
            reborrowHints = {
                enable = "never",
            },
            renderColons = true,
            typeHints = {
                enable = true,
                hideClosureInitialization = false,
                hideNamedConstructor = false,
            },
        },
        cachePriming = {
            enable = true,
        },
        diagnostics = {
            enable = vim.g.lazyvim_rust_diagnostics == "rust-analyzer",
            refreshSupport = true,
        },
        cargo = {
            autoreload = true,
            loadOutDirsFromCheck = true,
            allFeatures = true,
            buildScripts = {
                enable = true,
            },
            target = vim.env.NEOVIM_RUST_TARGET,
        },
        hoverActions = {
            enable = true,
            references = true,
        },
        procMacro = {
            enable = true,
            ignored = {
                -- ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
            },
        },
    }

    return opts
end

return {

    {
        "mason-org/mason.nvim",
        optional = true,
        opts = function(_, opts)
            for i, v in ipairs(opts.ensure_installed) do
                if v == "bacon" then
                    table.remove(opts.ensure_installed, i)
                    break
                end
            end
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        opts = function()
            return {
                server = {
                    default_settings = {
                        ["rust-analyzer"] = rust_analyzer_settings(),
                    },
                },
            }
        end,
    },
}
