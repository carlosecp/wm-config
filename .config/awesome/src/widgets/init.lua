local awful = require("awful")
local wibox = require("wibox")

local clock    = wibox.widget.textclock()
local kbd      = awful.widget.keyboardlayout()
local taglist  = require("src.widgets.taglist")
local tasklist = require("src.widgets.tasklist")

local widgets = {
	clock    = clock,
	kbd      = kbd,
	taglist  = taglist,
	tasklist = tasklist
}

return widgets
