local beautiful = require("beautiful")
local gears     = require("gears")
local naughty   = require("naughty")

-- load the default theme and layout.
-- TODO: No quiero hacer esto hardcodeado.
beautiful.init("/home/carlosecp/.config/awesome/src/theme/default.lua")

-- general style options.
local opts = {
	border_width         = 1,
	font                 = "sans 8",
	gap_single_client    = true,
	useless_gap          = 8,
	systray_icon_spacing = 4
}

local colors = require("src.theme.colors")
local colorscheme = colors["nord"]

gears.table.crush(beautiful, opts)
gears.table.crush(beautiful, colorscheme)

local notification_opts = {
	border_width = 2,
	max_height   = 100,
	max_width    = 300,
	opacity      = 0.75
}

setmetatable(notification_opts, {
	__index = function(table, key)
		if table[key] == nil then return nil end
		return string.format("notification_%s", table[key])
	end
})

gears.table.crush(beautiful, notification_opts)

naughty.config.defaults.icon_size = 150
