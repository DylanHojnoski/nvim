local lsp = require('lsp-zero').preset("recommended")

lsp.ensure_installed({
	'tsserver',
	'eslint',
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.on_attach(function (slient, bufnr)
	local opts ={buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function () vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function () vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function () vim.lsp.buf.open_float() end, opts)
	vim.keymap.set("n", "d[", function () vim.lsp.buf.goto_next() end, opts)
	vim.keymap.set("n", "d]", function () vim.lsp.buf.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function () vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function () vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function () vim.lsp.buf.rename() end, opts)
end)

lsp.setup()
