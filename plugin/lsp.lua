vim.pack.add({'https://github.com/neovim/nvim-lspconfig'})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

