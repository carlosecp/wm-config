local awful = require("awful")
local gears = require("gears")

return gears.table.join(
	awful.button({ }, 1,
		function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
		end),
	awful.button({ _G.defaults.modkey }, 1,
		function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
			awful.mouse.client.move(c)
		end),
	awful.button({ _G.defaults.modkey }, 3,
		function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
			awful.mouse.client.resize(c)
		end)
)