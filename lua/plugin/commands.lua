-- Close File
vim.api.nvim_create_user_command('CloseOtherFiles', function()
  vim.cmd("%bdelete|edit #|normal`")
end, {})
vim.api.nvim_create_user_command('CloseCurrentFile', function()
  vim.cmd("bp|bd#")
end, {})

-- Format File
vim.api.nvim_create_user_command('FormatJavaScript', function()
  vim.cmd("%!npx prettier --stdin-filepath %")
end, {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {"*.js", "*.ts"},
  command = "FormatJavaScript",
})
