-- ~/.config/awesome/modules/signals.lua
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

local signals = {}

signals.setup = function()
    client.connect_signal("manage", function (c)
        if awesome.startup
          and not c.size_hints.user_position
          and not c.size_hints.program_position then
            awful.placement.no_offscreen(c)
        end
    end)

    client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
    client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
end

return signals

