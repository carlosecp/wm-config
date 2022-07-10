local awful = require("awful")

return awful.widget.watch([[sh -c "acpi | grep -i -v 'Unknown' | awk '{print $NF}'"]], 30, function(widget, stdout)
	widget:set_text(string.format("Battery: %s", stdout))
end)
