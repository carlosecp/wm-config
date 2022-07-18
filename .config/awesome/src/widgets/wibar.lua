local awful     = require("awful")
local beautiful = require("beautiful")
local gears     = require("gears")
local menubar   = require("menubar")
local wibox     = require("wibox")

local widgets = require("src.widgets")

local function systray()
	local widget = wibox.widget.systray()
	widget:set_base_size(16)
	return wibox.layout.margin(widget, 3, 3, 3, 3)
end

local M = {}

-- READ: https://awesomewm.org/doc/api/classes/wibox.layout.fixed.html#wibox.layout.fixed.horizontal
function M.setup(s)
	s.mytaglist  = awful.widget.taglist(widgets.taglist.setup(s))
	s.mytasklist = awful.widget.tasklist(widgets.tasklist.setup(s))
	s.mywibox    = awful.wibar({
		position = "top",
		screen   = s
	})

	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{
			layout = wibox.layout.fixed.horizontal,
			s.mytaglist
		},
		{
			layout = wibox.container.place,
			placement = awful.placement.centered,
			widgets.clock,
			valign = "center",
			halign = "center"
		},
		{
			layout = wibox.layout.fixed.horizontal,
			spacing = 4,
			systray(),
			widgets.kbd,
			widgets.brightness,
			widgets.volume,
			widgets.battery,
			s.mylayoutbox
		}
	})
end

return M
