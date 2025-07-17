function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

function imap(shortcut, command)
    map('i', shortcut, command)
end


--- leader
vim.g.mapleader = " "


---
-- lsp (now handled by buffer-local keybindings in lsp.lua)
---

-- Global LSP-related keybindings
nmap("<leader>to", ":TodoLocList<CR>")
nmap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
nmap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
nmap("<leader>dl", "<cmd>lua vim.diagnostic.open_float()<CR>")

---
-- telescope
---
nmap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap("<leader>fh", "<cmd>lua require('telescope.builtin').command_history()<cr>")

----
-- debugging
----
nmap("<leader>db", "<cmd>DapToggleBreakpoint<cr>")
nmap("<leader>do", "<cmd>DapStepOut<cr>")
nmap("<leader>dn", "<cmd>DapStepOver<cr>")
nmap("<leader>di", "<cmd>DapStepInto<cr>")
nmap("<leader>dc", "<cmd>DapContinue<cr>")
nmap("<leader>dr", "<cmd>DapToggleRepl<cr>")

nmap("<leader>dlb", "<cmd>Telescope dap list_breakpoints<cr>")
nmap("<leader>dlc", "<cmd>Telescope dap commands<cr>")
nmap("<leader>dlv", "<cmd>Telescope dap variables<cr>")
nmap("<leader>dlf", "<cmd>Telescope dap frames<cr>")

----
-- git
----
nmap("<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<cr>")
nmap("<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<cr>")
nmap("<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>")
nmap("<leader>gdo", "<cmd>DiffviewOpen main<cr>")
nmap("<leader>gdc", "<cmd>DiffviewClose<cr>")

----
-- TodoComments
----
nmap("<leader>ft", "<cmd>TodoTelescope<cr>")


----
-- NvimTreeToggle
----
nmap("<leader>tt", ":NvimTreeToggle<cr>")

---
--BufferPick
---
nmap("]b", ":BufferLineCycleNext<cr>")
nmap("[b", ":BufferLineCyclePrev<cr>")
