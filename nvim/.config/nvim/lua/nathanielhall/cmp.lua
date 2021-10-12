local cmp = require("cmp")
local minsnip = require("minsnip")

local u = require("utils")

cmp.setup({
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                u.input("<C-n>", "n")
            elseif not minsnip.jump() then
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                u.input("<C-p>", "n")
            elseif not minsnip.jump_backwards() then
                fallback()
            end
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "minsnip" },
        { name = "buffer" },
    },
})
