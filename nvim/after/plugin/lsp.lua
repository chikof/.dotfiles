local Remap = require("chiko.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

-- local sumneko_root_path = "~/.config/lua-server"
-- local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
    youtube = "[Suck it YT]",
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    path = "[Path]",
}
local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            -- vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` user.
            require("luasnip").lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            vim_item.menu = menu
            return vim_item
        end,
    },

    sources = {
        { name = "nvim_lsp" },

        -- For vsnip user.
        -- { name = 'vsnip' },

        -- For luasnip user.
        { name = "luasnip" },

        -- For ultisnips user.
        -- { name = 'ultisnips' },

        { name = "buffer" },

        { name = "youtube" },
    },
})


local function config(_config)
    return vim.tbl_deep_extend("force", {
        on_attach = function()
            local opts = { buffer = true };
            nnoremap("gd", function() vim.lsp.buf.definition() end, opts)
            nnoremap("K", function() vim.lsp.buf.hover() end, opts)
            nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            nnoremap("<leader>vd", function() vim.diagnostic.open_float() end, opts)
            nnoremap("[d", function() vim.diagnostic.goto_next() end, opts)
            nnoremap("]d", function() vim.diagnostic.goto_prev() end, opts)
            nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
                    filter = function(code_action)
                        if not code_action or not code_action.data then
                            return false
                        end

                        local data = code_action.data.id
                        return string.sub(data, #data - 1, #data) == ":0"
                    end,
                    apply = true
                })
            end, opts)
            nnoremap("<leader>vrr", function() vim.lsp.buf.references() end, opts)
            nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            inoremap("<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end,
    }, _config or {})
end

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
    -- require'completion'.on_attach(client)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- who even uses this?
require("lspconfig").rust_analyzer.setup(config({
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    -- on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        rust = {
            unstable_features = true,
            build_on_save = false,
            all_features = true,
        },
    }
}))

require("lspconfig").tsserver.setup(config({
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
    capabilities = capabilities,
    on_attach = on_attach
}))

--[[
local tw_highlight = require('tailwind-highlight')
require("lspconfig").tailwindcss.setup(config({
    --filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    on_attach = function(client, bufnr)
        tw_highlight.setup(client, bufnr, {
            single_column = false,
            mode = "background",
            debounce = 200,
        })
    end,
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    "tw`([^`]*)", -- tw`...`
                    "tw=\"([^\"]*)", -- <div tw="..." />
                    "tw={\"([^\"}]*)", -- <div tw={"..."} />
                    "tw\\.\\w+`([^`]*)", -- tw.xxx`...`
                    "tw\\(.*?\\)`([^`]*)" -- tw(Component)`...`
                }
            }
        },
        includeLanguages = {
            typescript = 'javascript',
            typescriptreact = 'javascript',
        },
        scss = { validate = false },
        editor = {
            quickSuggestions = { strings = true },
            autoClosingQuotes = 'always',
        },
    },
    capabilities = capabilities,
}))
]]--

require("lspconfig").sumneko_lua.setup(config({
    -- cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
}))

require("lspconfig").eslint.setup(config())

require("lspconfig").prismals.setup(config({
    capabilities = capabilities
}))

require("lspconfig").jsonls.setup(config({
    capabilities = capabilities
}))

require("lspconfig").html.setup({
    capabilities = capabilities
})

require("lspconfig").cssls.setup(config())

local opts = {
    -- whether to highlight the currently hovered symbol
    -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = true,

    -- whether to show outline guides
    -- default: true
    show_guides = true,
}

require("symbols-outline").setup(opts)
