local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local menubar = require("menubar")
local wibox = require("wibox")

local clock_widget = require("src.widgets.clock")
local keyboard_layout_widget = require("src.widgets.keyboard_layout")
local launcher_widget = require("src.widgets.launcher")
local taglist_widget = require("src.widgets.taglist")
local tasklist_widget = require("src.widgets.tasklist")
local volume_widget = require("src.widgets.volume")

local M = {
	tags = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
}

beautiful.systray_icon_spacing = 4
local systray_widget = wibox.widget.systray()
-- systray:set_base_size(16)

function M.setup(s)
	s.mytaglist = awful.widget.taglist(taglist_widget.setup(s))
	s.mytasklist = awful.widget.tasklist(tasklist_widget.setup(s))
	s.mywibox = awful.wibar({ position = "top", screen = s })

	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{
			layout = wibox.layout.fixed.horizontal,
			-- launcher_widget,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist,
		{
			layout = wibox.layout.fixed.horizontal,
			keyboard_layout_widget,
			volume_widget { widget_type = "icon_and_text" },
			systray_widget,
			clock_widget,
			s.mylayoutbox,
		}
	})
end

return M
