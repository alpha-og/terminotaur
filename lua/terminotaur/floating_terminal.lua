-- luacheck: globals vim

local function create_floating_window(opts)
	opts = opts or {}
	-- Get the screen dimensions
	local screen_width = vim.o.columns
	local screen_height = vim.o.lines

	-- Default width and height to 80% of the screen dimensions
	local width = opts.width or math.floor(screen_width * 0.8)
	local height = opts.height or math.floor(screen_height * 0.8)

	-- Calculate the centered position
	local col = math.floor((screen_width - width) / 2)
	local row = math.floor((screen_height - height) / 2)

	-- Configure the window options
	local win_opts = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded", -- You can use "single", "double", "solid", or "shadow" as well
	}

	-- Create a new buffer
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- Create a non-listed, scratch buffer
	end

	-- Create the floating window
	local win = vim.api.nvim_open_win(buf, true, win_opts)

	return { buf = buf, win = win }
end
local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}
local function toggle_floating_terminal()
	if vim.api.nvim_win_is_valid(state.floating.win) then
		vim.api.nvim_win_hide(state.floating.win)
	else
		state.floating = create_floating_window({
			buf = state.floating.buf,
		})
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
			vim.cmd.startinsert()
		end
	end
end

return {
	toggle = toggle_floating_terminal,
}
