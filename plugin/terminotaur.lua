-- luacheck: globals vim

print("terminotaur.nvim loaded")
vim.api.nvim_create_user_command("ToggleFloatingTerminal", require("terminotaur.floating_terminal").toggle, {})
vim.api.nvim_create_user_command("OpenNewVerticalTerminal", require("terminotaur.split_terminal").vertical, {})
vim.api.nvim_create_user_command("OpenNewHorizontalTerminal", require("terminotaur.split_terminal").horizontal, {})
