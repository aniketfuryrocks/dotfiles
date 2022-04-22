function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end


function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

-- lsp
nmap("<leader>gd","<cmd>lua vim.lsp.buf.definition()<CR>")
nmap("<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
nmap("<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
nmap("<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
nmap("<leader>fs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
nmap("<leader>fas", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
nmap("<leader>fmt", "<cmd>lua vim.lsp.buf.formatting()<CR>")
nmap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
nmap("<a-cr>", "<cmd>lua vim.lsp.buf.code_action()<CR>")

-- diagnostics
nmap("<leader>dig", ":DiagnosticsAll<CR>")
nmap("<leader>to", ":TodoLocList<CR>")

-- telescope
 
nmap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
nmap("<leader>fh", "<cmd>lua require('telescope.builtin').command_history()<cr>")

nmap("<M-1>", ":NvimTreeToggle<CR>")


