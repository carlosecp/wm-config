local gears = require("gears")
local naughty   = require("naughty")

-- REFACTOR: I don't really like how this works because the user could not have
-- their wallpapers there. In any case this defaults to the awesome default
-- wallpaper but still I think I can improve it.
local function wallpaper(img)
	local home_dir = os.getenv("HOME")
	local wallpaper_dir = string.format("%s/%s", home_dir, ".wallpapers")
	return string.format("%s/%s", wallpaper_dir, img)
end

local M = {
	nord = {
		bg_focus      = "#434c5e",
		bg_minimize   = "#2e3440",
		bg_normal     = "#2e3440",
		bg_systray    = "#2e3440",
		bg_urgent     = "#bf616a",
		border_focus  = "#616d87",
		border_normal = "#3b4252",
		wallpaper     = wallpaper("nord_macos.png")
	}
}

setmetatable(M, {
	__index = function(table, key)
		return {}
	end
})

return M
