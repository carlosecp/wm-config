local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

require("awful.autofocus")

local wibar = require("src.widgets.wibar")

local function set_wallpaper(s)
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

screen.connect_signal("property::geometry", set_wallpaper)

awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.floating,
}

awful.screen.connect_for_each_screen(function(s)
	set_wallpaper(s)

	awful.tag(wibar.tags, s, awful.layout.layouts[1])

	s.mypromptbox = awful.widget.prompt()

	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({ }, 1, function()
			awful.layout.inc( 1)
		end),
		awful.button({ }, 3, function()
			awful.layout.inc(-1)
		end)
	))

	wibar.setup(s)
end)
