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

function M.setup(s)
	s.mytaglist  = awful.widget.taglist(widgets.taglist.setup(s))
	s.mytasklist = awful.widget.tasklist(widgets.tasklist.setup(s))
	s.mywibox    = awful.wibar({ position = "top", screen = s })

	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{
			layout = wibox.layout.fixed.horizontal,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist,
		{
			layout = wibox.layout.fixed.horizontal,
			widgets.kbd,
			widgets.brightness,
			widgets.volume,
			widgets.battery,
			systray(),
			widgets.clock,
			s.mylayoutbox,
		}
	})
end

return M
