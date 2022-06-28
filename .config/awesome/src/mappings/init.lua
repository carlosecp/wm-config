local awful = require "awful"
local gears = require "gears"
local hotkeys_popup = require "awful.hotkeys_popup"
local menubar = require("menubar")

menubar.utils.terminal = _G.defaults.apps.terminal

local menu = require "src.widgets.floating_menu"

root.buttons(gears.table.join(
	awful.button({ }, 3,
		function()
			menu:toggle()
		end)
))

local M = {}

local mappings = gears.table.join(
	awful.key({ _G.defaults.modkey }, "s", hotkeys_popup.show_help,
		{ description="show help", group="awesome" }),

	awful.key({ _G.defaults.modkey }, "Left", awful.tag.viewprev,
		{ description = "view previous", group = "tag" }),

	awful.key({ _G.defaults.modkey }, "Right", awful.tag.viewnext,
		{ description = "view next", group = "tag" }),

	awful.key({ _G.defaults.modkey }, "Escape", awful.tag.history.restore,
		{ description = "go back", group = "tag" }),

	awful.key({ _G.defaults.modkey }, "j",
		function()
			awful.client.focus.byidx(1)
		end,
		{ description = "focus next by index", group = "client" }),

	awful.key({ _G.defaults.modkey }, "k",
		function()
			awful.client.focus.byidx(-1)
		end,
		{ description = "focus previous by index", group = "client" }),

	awful.key({ _G.defaults.modkey }, "w", 
		function()
			menu:show()
		end,
		{ description = "show main menu", group = "awesome" }),

	awful.key({ _G.defaults.modkey, "Shift" }, "j",
		function()
			awful.client.swap.byidx(1)
		end,
		{ description = "swap with next client by index", group = "client" }),

	awful.key({ _G.defaults.modkey, "Shift" }, "k",
		function()
			awful.client.swap.byidx(-1)
		end,
		{ description = "swap with previous client by index", group = "client" }),

	awful.key({ _G.defaults.modkey, "Control" }, "j",
		function()
			awful.screen.focus_relative(1)
		end,
		{ description = "focus the next screen", group = "screen" }),

	awful.key({ _G.defaults.modkey, "Control" }, "k",
		function()
			awful.screen.focus_relative(-1)
		end,
		{ description = "focus the previous screen", group = "screen" }),

	awful.key({ _G.defaults.modkey }, "u", awful.client.urgent.jumpto,
		{ description = "jump to urgent client", group = "client" }),

	awful.key({ _G.defaults.modkey }, "Tab",
		function()
			awful.client.focus.history.previous()
			if client.focus then client.focus:raise() end
		end,
		{ description = "go back", group = "client" }),

	awful.key({ _G.defaults.modkey }, "Return",
		function()
			awful.spawn(_G.defaults.apps.terminal)
		end,
		{ description = "open a terminal", group = "launcher" }),

	awful.key({ _G.defaults.modkey }, "e",
		function()
			awful.spawn("emacsclient -c")
		end,
		{ description = "open a terminal", group = "launcher" }),

	awful.key({ _G.defaults.modkey, "Control" }, "r", awesome.restart,
		{ description = "reload awesome", group = "awesome" }),

	awful.key({ _G.defaults.modkey, "Shift" }, "q", awesome.quit,
		{ description = "quit awesome", group = "awesome" }),

	awful.key({ _G.defaults.modkey }, "l",
		function()
			awful.tag.incmwfact(0.05)
		end,
		{ description = "increase master width factor", group = "layout" }),

	awful.key({ _G.defaults.modkey }, "h",
		function()
			awful.tag.incmwfact(-0.05)
		end,
		{ description = "decrease master width factor", group = "layout" }),

	awful.key({ _G.defaults.modkey, "Shift" }, "h",
		function()
			awful.tag.incnmaster(1, nil, true)
		end,
		{ description = "increase the number of master clients", group = "layout" }),

	awful.key({ _G.defaults.modkey, "Shift" }, "l", 
		function()
			awful.tag.incnmaster(-1, nil, true)
		end,
		{ description = "decrease the number of master clients", group = "layout" }),

	awful.key({ _G.defaults.modkey, "Control" }, "h",
		function()
			awful.tag.incncol(1, nil, true)
		end,
		{ description = "increase the number of columns", group = "layout" }),

	awful.key({ _G.defaults.modkey, "Control" }, "l",
		function()
			awful.tag.incncol(-1, nil, true)
		end,
		{ description = "decrease the number of columns", group = "layout" }),

	awful.key({ _G.defaults.modkey }, "space",
		function()
			awful.layout.inc(1)
		end,
		{ description = "select next", group = "layout" }),

	awful.key({ _G.defaults.modkey, "Shift" }, "space",
		function()
			awful.layout.inc(-1)
		end,
		{ description = "select previous", group = "layout" }),

	awful.key({ _G.defaults.modkey, "Control" }, "n",
		function()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal("request::activate", "key.unminimize", { raise = true })
			end
		end,
		{ description = "restore minimized", group = "client" }),

	-- Prompt
	awful.key({ _G.defaults.modkey }, "r",
		function()
			awful.screen.focused().mypromptbox:run()
		end,
		{ description = "run prompt", group = "launcher" }),

	awful.key({ }, "XF86Search",
		function()
			menubar.show()
		end,
		{ description = "run prompt", group = "launcher" }),

	awful.key({ _G.defaults.modkey }, "x",
		function()
			awful.prompt.run({
				prompt = "Run Lua code: ",
				textbox = awful.screen.focused().mypromptbox.widget,
				exe_callback = awful.util.eval,
				history_path = awful.util.get_cache_dir() .. "/history_eval"
			})
		end,
		{ description = "lua execute prompt", group = "awesome" }),

	awful.key({ _G.defaults.modkey }, "p",
		function()
			menubar.show()
		end,
		{ description = "show the menubar", group = "launcher" })
)

for i = 1, 9 do
	mappings = gears.table.join(mappings,
		-- View tag only.
		awful.key({ _G.defaults.modkey }, "#" .. i + 9,
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			{ description = "view tag #"..i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ _G.defaults.modkey, "Control" }, "#" .. i + 9,
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					awful.tag.viewtoggle(tag)
				end
			end,
			{ description = "toggle tag #" .. i, group = "tag" }),

		-- Move client to tag.
		awful.key({ _G.defaults.modkey, "Shift" }, "#" .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
			{ description = "move focused client to tag #"..i, group = "tag" }),

		-- Toggle tag on focused client.
		awful.key({ _G.defaults.modkey, "Control", "Shift" }, "#" .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end,
			{ description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

root.keys(mappings)

require "src.mappings.clientkeys"
