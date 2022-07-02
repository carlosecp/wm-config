local awful = require("awful")
local gears = require("gears")

local M = {}

local buttons = gears.table.join(
	awful.button({ }, 1, function(t)
		-- Go to the clicked tag.
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		-- Move the current client to the clicked tags.
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({ modkey }, 3, function(t)
		-- Mirrors the currently focused client to the clicked tags.
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end)
)

M.setup = function(s)
	return {
		screen  = s,
		filter  = awful.widget.taglist.filter.all,
		buttons = buttons
	}
end

return M
