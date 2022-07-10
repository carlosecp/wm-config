local awful = require("awful")

return awful.widget.watch("xbacklight", 0.1, function(widget, stdout)
	local brightness = math.ceil(stdout)
	widget:set_text(string.format("Brightness: %s%%", brightness))
end)
