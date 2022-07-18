local awful = require("awful")
local wibox = require("wibox")

local clock    = wibox.widget.textclock()
local kbd      = awful.widget.keyboardlayout()
local taglist  = require("src.widgets.taglist")
local tasklist = require("src.widgets.tasklist")

local battery    = require("src.widgets.battery")
local brightness = require("src.widgets.brightness")
local volume     = require("src.widgets.volume")

-- local calendar = awful.widget.calendar_popup.month()
-- calendar:attach(clock, "tr")

local widgets = {
	battery    = battery,
	brightness = brightness,
	clock      = clock,
	kbd        = kbd,
	taglist    = taglist,
	tasklist   = tasklist,
	volume     = volume
}

return widgets
