local awful = require("awful")
local beautiful = require("beautiful")

local menu = require("src.widgets.floating_menu")

local launcher = awful.widget.launcher({
	image = beautiful.awesome_icon,
	menu = menu
})

return launcher
