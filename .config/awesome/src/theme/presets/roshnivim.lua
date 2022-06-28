local M = {}

M = {
	bg_normal     = "#222222",
	bg_focus      = "#535d6c",
	bg_focus      = "#0a3843",
	bg_urgent     = "#ff0000",
	bg_minimize   = "#444444",
	bg_systray    = M.bg_normal,

	fg_normal     = "#aaaaaa",
	fg_focus      = "#ffffff",
	fg_urgent     = "#ffffff",
	fg_minimize   = "#ffffff",

	border_normal = "#000000",
	border_focus  = "#535d6c",
	border_focus  = "#0a3843",
	border_marked = "#91231c",

	useless_gap = 4,
	border_width = 2,
	gap_single_client = false
}

return M
