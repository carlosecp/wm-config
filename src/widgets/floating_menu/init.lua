local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")

local editor = _G.defaults.apps.editor
local terminal = _G.defaults.apps.terminal
local editor_cmd = terminal .. " -e " .. editor

local submenus = {
	awesome_menu = {
		{ "hotkeys", function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end },
		{ "manual", terminal .. " -e man awesome" },
		{ "edit config", editor_cmd .. " " .. awesome.conffile },
		{ "restart", awesome.restart },
		{ "quit", awesome.quit },
	}
}

local menu = awful.menu({
	items = {
		{ "awesome", submenus.awesome_menu, beautiful.awesome_icon },
		{ "open terminal", terminal }
	}
})

return menu
