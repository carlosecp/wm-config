local awful         = require("awful")
local gears         = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar       = require("menubar")
local wibox         = require("wibox")

local modkey   = "Mod4"
local terminal = "kitty"
menubar.utils.terminal = terminal

local mappings = gears.table.join(
	awful.key({ modkey }, "s", hotkeys_popup.show_help),

	awful.key({ modkey }, "Left", awful.tag.viewprev),

	awful.key({ modkey }, "Right", awful.tag.viewnext),

	awful.key({ modkey }, "Escape", awful.tag.history.restore),

	awful.key({ modkey }, "j",
		function()
			awful.client.focus.byidx(1)
		end),

	awful.key({ modkey }, "k",
		function()
			awful.client.focus.byidx(-1)
		end),

	awful.key({ modkey, "Shift" }, "j",
		function()
			awful.client.swap.byidx(1)
		end),

	awful.key({ modkey, "Shift" }, "k",
		function()
			awful.client.swap.byidx(-1)
		end),

	awful.key({ modkey, "Control" }, "j",
		function()
			awful.screen.focus_relative(1)
		end),

	awful.key({ modkey, "Control" }, "k",
		function()
			awful.screen.focus_relative(-1)
		end),

	awful.key({ modkey }, "u", awful.client.urgent.jumpto),

	awful.key({ modkey }, "Tab",
		function()
			awful.client.focus.history.previous()
			if client.focus then client.focus:raise() end
		end),

	awful.key({ modkey }, "Return",
		function()
			awful.spawn(terminal)
		end),

	awful.key({ modkey, "Control" }, "r", awesome.restart),

	awful.key({ modkey, "Shift" }, "q", awesome.quit),

	awful.key({ modkey }, "l",
		function()
			awful.tag.incmwfact(0.05)
		end),

	awful.key({ modkey }, "h",
		function()
			awful.tag.incmwfact(-0.05)
		end),

	awful.key({ modkey, "Shift" }, "h",
		function()
			awful.tag.incnmaster(1, nil, true)
		end),

	awful.key({ modkey, "Shift" }, "l", 
		function()
			awful.tag.incnmaster(-1, nil, true)
		end),

	awful.key({ modkey, "Control" }, "h",
		function()
			awful.tag.incncol(1, nil, true)
		end),

	awful.key({ modkey, "Control" }, "l",
		function()
			awful.tag.incncol(-1, nil, true)
		end),

	awful.key({ modkey }, "space",
		function()
			awful.layout.inc(1)
		end),

	awful.key({ modkey, "Shift" }, "space",
		function()
			awful.layout.inc(-1)
		end),

	awful.key({ modkey, "Control" }, "n",
		function()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal("request::activate", "key.unminimize", { raise = true })
			end
		end),

	awful.key({ modkey }, "p",
		function()
			menubar.show()
		end)
)

for i = 1, 9 do
	mappings = gears.table.join(mappings,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9,
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			{ description = "view tag #"..i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9,
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					awful.tag.viewtoggle(tag)
				end
			end),

		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end),

		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end)
	)
end

root.keys(mappings)

local M = {}

M.clientkeys = gears.table.join(
	awful.key({ modkey }, "f",
		function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end),

	awful.key({ modkey, "Shift" }, "c",
		function(c)
			c:kill()
		end),

	awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle),

	awful.key({ modkey, "Control" }, "Return",
		function(c)
			c:swap(awful.client.getmaster())
		end),

	awful.key({ modkey }, "o",
		function(c)
			c:move_to_screen()
		end),

	awful.key({ modkey }, "t",
		function(c)
			c.ontop = not c.ontop
		end),

	awful.key({ modkey }, "n",
		function(c)
			c.minimized = true
		end),

	awful.key({ modkey }, "m",
		function(c)
			c.maximized = not c.maximized
			c:raise()
		end),

	awful.key({ modkey, "Control" }, "m",
		function(c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end),

	awful.key({ modkey, "Shift" }, "m",
		function(c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end)
)

M.clientbuttons = gears.table.join(
	awful.button({ }, 1,
		function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
		end),

	awful.button({ modkey }, 1,
		function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
			awful.mouse.client.move(c)
		end),

	awful.button({ modkey }, 3,
		function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
			awful.mouse.client.resize(c)
		end)
)

return M
