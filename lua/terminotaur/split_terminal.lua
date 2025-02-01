-- luacheck: globals vim

-- open terminal in a vertical split
local function open_new_terminal_in_vsplit()
	vim.cmd.vnew()
	vim.cmd.terminal()
	vim.cmd.wincmd("L")
	local width = vim.api.nvim_win_get_width(0)
	local terminal_width = math.floor(width * 0.5)
	vim.api.nvim_win_set_width(0, terminal_width)
	vim.cmd.startinsert()
end

-- open terminal in a horizontal split
local function open_new_terminal_in_hsplit()
	vim.cmd.new()
	vim.cmd.terminal()
	vim.cmd.wincmd("J")
	local height = vim.api.nvim_win_get_height(0)
	local terminal_height = math.floor(height * 0.4)
	vim.api.nvim_win_set_height(0, terminal_height)
	vim.cmd.startinsert()
end

return {
	vertical = open_new_terminal_in_vsplit,
	horizontal = open_new_terminal_in_hsplit,
}
