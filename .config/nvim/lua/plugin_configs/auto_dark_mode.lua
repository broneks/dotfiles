local auto_dark_mode_status_ok, auto_dark_mode = pcall(require, 'auto-dark-mode')
if not auto_dark_mode_status_ok then
	return
end

auto_dark_mode.setup({
		update_interval = 1000,
		set_dark_mode = function()
			vim.cmd('colorscheme carbonfox')
		end,
		set_light_mode = function()
			vim.cmd('colorscheme terafox')
		end,
	})
auto_dark_mode.init()
