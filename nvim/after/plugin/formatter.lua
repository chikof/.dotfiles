local status, mason_null_ls = pcall(require, "mason-null-ls")
if not status then
	return
end

mason_null_ls.setup({
	ensure_installed = nil,
	automatic_installation = false,
	handlers = {},
	automatic_setup = true,
})

local nstatus, null_ls = pcall(require, "null-ls")
if not nstatus then
	return
end

null_ls.setup({
	sources = { null_ls.builtins.code_actions.gitsigns },
})
