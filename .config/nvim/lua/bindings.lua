function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

function imap(shortcut, command)
    map('i', shortcut, command)
end

---
-- lsp
---

-- go to
nmap("<leader>gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
nmap("<leader>gt", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>")
nmap("<leader>gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>")
nmap("<leader>gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>")

-- code actions
nmap("<a-cr>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")

-- symbols
nmap("<leader>fs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")
nmap("<leader>fas", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>")

-- format
nmap("<leader>fmt", "<cmd>lua vim.lsp.buf.formatting()<CR>")

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
-- git
----
nmap("<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<cr>")
nmap("<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>")
nmap("<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<cr>")
nmap("<leader>gst", "<cmd>lua require('telescope.builtin').git_stash()<cr>")


----
-- TodoComments
----
nmap("<leader>ft", "<cmd>TodoTelescope<cr>")


----
-- NvimTreeToggle
----
nmap("<M-1>", ":NvimTreeToggle<CR>")
