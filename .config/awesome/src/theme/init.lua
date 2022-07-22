local beautiful = require("beautiful")
local gears     = require("gears")
local naughty   = require("naughty")

-- load the default theme and layout.
-- TODO: No quiero hacer esto hardcodeado.
beautiful.init("/home/carlosecp/.config/awesome/src/theme/default.lua")

-- general style options.
local opts = {
	border_width         = 1,
	font                 = "Cantarell Bold 9",
	gap_single_client    = true,
	useless_gap          = 8,
	systray_icon_spacing = 4
}

local colors = require("src.theme.colors")
local colorscheme = colors["nord"]

gears.table.crush(beautiful, opts)
gears.table.crush(beautiful, colorscheme)

local notification_opts = {
	notification_border_width = 2,
	notification_max_height   = 100,
	notification_max_width    = 300,
	notification_opacity      = 0.75
}

gears.table.crush(beautiful, notification_opts)

naughty.config.defaults.icon_size = 150
