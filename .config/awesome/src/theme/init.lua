local beautiful = require("beautiful")
local gears = require("gears")
local naughty = require("naughty")

local default_theme = require("src.theme.default")

beautiful.init(default_theme)

local presets = require("src.theme.presets")
-- for key, val in pairs(presets[_G.defaults.theme_preset]) do
for key, val in pairs(presets.nord) do
	beautiful[key] = val
end

beautiful.notification_max_height = 100
beautiful.notification_max_width = 300
beautiful.notification_opacity = 0.75
beautiful.notification_border_width = 2
