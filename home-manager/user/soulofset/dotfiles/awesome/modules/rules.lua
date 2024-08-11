-- ~/.config/awesome/modules/rules.lua
local awful = require("awful")
local beautiful = require("beautiful")

local rules = {}

rules.create = function()
    return {
        -- All clients will match this rule.
        {
            rule = { },
            properties = {
                border_width = beautiful.border_width,
                border_color = beautiful.border_normal,
                focus = awful.client.focus.filter,
                raise = true,
                keys = clientkeys,
                buttons = clientbuttons,
                screen = awful.screen.preferred,
                placement = awful.placement.no_overlap + awful.placement.no_offscreen,
                titlebars_enabled = true
            }
        },
        -- Ensure all floating windows stay on top
        {
            rule = { },
            properties = {
                ontop = true,
            },
            callback = function(c)
                if c.floating then
                    c.ontop = true
                end
            end
        },
    }
end

return rules

