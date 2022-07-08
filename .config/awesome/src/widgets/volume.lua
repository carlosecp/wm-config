local awful = require("awful")

return awful.widget.watch("pamixer --get-volume-human", 0.1, function(widget, stdout)
	widget:set_text(string.format("Volume: %s", stdout))
end)
