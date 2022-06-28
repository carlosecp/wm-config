local awful = require("awful")
local beautiful = require("beautiful")
local clientkeys = require("src.mappings.clientkeys")
local clientbuttons = require("src.mappings.clientbuttons")

awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = { },
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen
		}
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA",   -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin",
				"Sxiv",
				"Wpa_gui",
				"veromix",
				"xtightvncviewer"
			},
			name = { "Event Tester" },
			role = { "pop-up" }
		},
		properties = {
			floating = true,
			titlebars_enabled = true 
		}
	},

	-- Add titlebars to normal clients and dialogs
	{
		rule_any = { type = { "normal", "dialog" }},
		properties = { titlebars_enabled = false }
	},

	-- Send specific applications to certain workspace
	{
		rule_any = { class = { "Slack", "discord" }},
		properties = { tag = "9" }
	},

	{
		rule_any = { class = { "Spotify" }},
		properties = { tag = "8" }
	},

	{
		rule_any = { class = { "Dragon-drop" }},
		properties = { placement = awful.placement.centered }
	}
}
