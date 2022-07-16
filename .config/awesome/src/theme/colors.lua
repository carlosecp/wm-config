local gears = require("gears")
local naughty   = require("naughty")

local wallpapers_dir = "/home/carlosecp/.wallpapers/"

local M = {
	nord = {
		bg_focus      = "#434c5e",
		bg_minimize   = "#2e3440",
		bg_normal     = "#2e3440",
		bg_systray    = "#2e3440",
		bg_urgent     = "#bf616a",
		border_focus  = "#616d87",
		border_normal = "#3b4252",
		wallpaper     = wallpapers_dir .. "nord_mojave.png"
	},
	gruvbox = {
		bg_focus      = "#3c3836",
		bg_minimize   = "#282828",
		bg_normal     = "#282828",
		bg_systray    = "#282828",
		bg_urgent     = "#cc241d",
		border_focus  = "#504945",
		border_normal = "#3c3836",
		wallpaper     = wallpapers_dir .. "gruvbox_pacman.png"
	},
	solarized = {
		bg_focus      = "#586e75",
		bg_minimize   = "#002b36",
		bg_normal     = "#002b36",
		bg_systray    = "#002b36",
		bg_urgent     = "#dc322f",
		border_focus  = "#586e75",
		border_normal = "#073642",
		wallpaper     = wallpapers_dir .. "solarized.jpg"
	}
}

setmetatable(M, {
	__index = function(table, key)
		return {}
	end
})

return M
