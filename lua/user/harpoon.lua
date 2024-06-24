local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED
--
local settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
    key = function()
        return vim.loop.cwd()
    end,
}

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>u", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>i", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>o", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>p", function() harpoon:list():select(4) end)

-- Toggle previous & next b ffers stoked within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
