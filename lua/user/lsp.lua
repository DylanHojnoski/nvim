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

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client:supports_method('textDocument/completion') then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- })

-- Map Tab for smart navigation and indentation
-- vim.api.nvim_set_keymap('i', '<Tab>',
--   'pumvisible() ? "\\<Down>" : "\\<Tab>"',
--   { noremap = true, expr = true, silent = true, desc = "Next completion or indent" }
-- )

-- Map Shift-Tab for navigating backward
-- vim.api.nvim_set_keymap('i', '<S-Tab>',
--   'pumvisible() ? "\\<Up>" : "\\<S-Tab>"',
--   { noremap = true, expr = true, silent = true, desc = "Previous completion or unindent" }
-- )

-- Map Enter to confirm completion or insert a newline
vim.keymap.set('i', '<CR>', function()
  if vim.fn.pumvisible() == 1 then
    -- CASE 1: Autocomplete window IS open
    -- Confirm the selected item (equivalent to pressing <C-y>)
    return vim.api.nvim_replace_termcodes('<C-y>', true, false, true)
  else
    -- CASE 2: Autocomplete window IS NOT open
    -- Insert a normal newline (equivalent to pressing Enter normally)
    return vim.api.nvim_replace_termcodes('<CR>', true, false, true)
  end
end, { expr = true, silent = true, noremap = true, desc = 'Confirm completion / New line' })

vim.diagnostic.config({ virtual_text = true })
