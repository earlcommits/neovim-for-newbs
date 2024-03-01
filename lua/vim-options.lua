vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

vim.opt.clipboard:append("unnamedplus")
vim.opt.ignorecase = true
vim.opt.relativenumber = true

local function save_on_insert_leave()
    vim.api.nvim_create_autocmd("InsertLeave", {
        pattern = "*",
        callback = function()
            --pcall(function() require("prettier").format() end)
            vim.cmd('silent! write')
        end
    })
end

save_on_insert_leave()

vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>lua require("prettier").format()<CR>:w<CR>', { noremap = true, silent = true })
