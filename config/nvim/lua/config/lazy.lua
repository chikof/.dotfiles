local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
    lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json", -- lockfile generated after running update
    spec = {
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        { import = "plugins" },
    },
    ui = {
        backdrop = 100,       -- backdrop opacity, 100 is transparent
        border = "rounded",   -- rounded borders
        title = "Lazy.nvim",  -- only applies when border is not "none"
        title_pos = "center", -- only applies when border is not "none"
    },
    defaults = {
        lazy = false,
        version = false, -- always use the latest git commit
    },
    -- install = { colorscheme = { "tokyonight" } },
    checker = { enabled = false }, -- automatically check for plugin updates
    performance = {
        rtp = {
            disabled_plugins = {
                "netrwPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
                "2html_plugin",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "matchit",
                "tar",
                "tarPlugin",
                "rrhelper",
                "spellfile_plugin",
                "vimball",
                "vimballPlugin",
                "zip",
            },
        },
    },
})
