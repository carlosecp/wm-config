local awful = require("awful")
local gears = require("gears")

local M = {}

local buttons = gears.table.join(
	awful.button({ }, 1, function (c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal(
				"request::activate",
				"tasklist",
				{ raise = true }
			)
		end
	end),
	awful.button({ }, 3, function()
		-- Show a dropdown menu with all the opened clients.
		awful.menu.client_list({ theme = { width = 250 } })
	end)
)

M.setup = function(s)
	return {
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = buttons
	}
end

return M
