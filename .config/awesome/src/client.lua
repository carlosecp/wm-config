local awful      = require("awful")
local beautiful  = require("beautiful")
local gears      = require("gears")

local mappings      = require("src.mappings")
local clientbuttons = mappings.clientbuttons
local clientkeys    = mappings.clientkeys

awful.rules.rules = {
	{
		rule = { },
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus        = awful.client.focus.filter,
			raise        = true,
			keys         = clientkeys,
			buttons      = clientbuttons,
			screen       = awful.screen.preferred,
			placement    = awful.placement.no_overlap + awful.placement.no_offscreen
		}
	},

	{
		rule_any = {
			role = { "pop-up" }
		},
		properties = {
			floating          = true,
			titlebars_enabled = true
		}
	},

	-- Add titlebars to normal clients and dialogs
	{
		rule_any = {
			type = { "normal", "dialog" }
		},
		properties = {
			titlebars_enabled = false
		}
	},

	-- Send specific applications to certain workspace
	{
		rule_any = {
			class = { "Slack", "discord" }
		},
		properties = {
			tag = "9"
		}
	},

	{
		rule_any = {
			class = { "spotify", "Spotify" }
		},
		properties = {
			tag = "8"
		}
	},

	{
		rule_any = { class = { "edu.fiuba.algo3.App" }},
		properties = {
			titlebars_enabled = true,
			tag = "2"
		}
	},

	{
		rule = { floating = true },
		properties = { placement = awful.placement.centered }
	}
}
