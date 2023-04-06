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
-- lsp
---

-- go to
nmap("<leader>gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
nmap("<leader>gt", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>")
nmap("<leader>fi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>")
nmap("<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>")

-- code actions
nmap("<a-cr>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
nmap("<leader>h", "<cmd>lua vim.lsp.buf.hover()<cr>")

-- symbols
nmap("<leader>fs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")
nmap("<leader>fas", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>")

-- format
nmap("<leader>fmt", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")

-- rename
nmap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")

-- diagnostics
nmap("<leader>dig", "<cmd>lua require('telescope.builtin').diagnostics()<cr>")
nmap("<leader>to", ":TodoLocList<CR>")

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
