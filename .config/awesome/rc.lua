local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Startup Error!",
		text = awesome.startup_errors
	})
end

do
	local in_error = false
	awesome.connect_signal("debug::error", function (err)
		if in_error then return end
		in_error = true
		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Error!",
			text = tostring(err)
		})
		in_error = false
	end)
end

_G.defaults = {
	apps = {
		editor = "nvim",
		terminal = "kitty"
	},
	modkey = "Mod4",
	theme_preset = "gruvbox"
}

require("src.theme")
require("src.mappings")
require("src.rules")
require("src.screen")
require("src.signals")
