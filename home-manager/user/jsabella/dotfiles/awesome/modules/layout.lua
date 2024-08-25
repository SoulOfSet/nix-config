-- ~/.config/awesome/modules/layout.lua
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local wibar = require("modules.wibar")

local layout = {}

-- Set your original custom wallpaper path
local original_wallpaper = "/home/jsabella/.assets/wallpapers/city.png"

layout.set_wallpaper = function(s)
    -- Use the original wallpaper
    local wallpaper = original_wallpaper

    -- If a theme wallpaper is defined, it can override the original wallpaper
    if beautiful.wallpaper then
        wallpaper = beautiful.wallpaper
    end

    -- If the wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end

    -- Set the wallpaper for the screen
    gears.wallpaper.maximized(wallpaper, s, true)
end

layout.setup_screen = function(s)
    -- Assign even workspaces to one screen and odd workspaces to another
    if s.index == 1 then
        -- Monitor 1 (assume the first monitor is assigned index 1)
        awful.tag({ "1", "3", "5", "7", "9" }, s, awful.layout.suit.spiral.dwindle)
    elseif s.index == 2 then
        -- Monitor 2 (assume the second monitor is assigned index 2)
        awful.tag({ "2", "4", "6", "8" }, s, awful.layout.suit.spiral.dwindle)
    else
        -- For any additional monitors, you can assign a different set of workspaces if needed
        awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.suit.spiral.dwindle)
    end

    -- Set up the wibar for the screen
    wibar.setup(s)

    -- Ensure the wallpaper is set for this screen
    layout.set_wallpaper(s)
end

-- Monitor Configuration
layout.setup_monitors = function()
    -- Configure monitors using xrandr
    awful.spawn.with_shell("xrandr --output DP-2 --mode 3840x2160 --rate 60 --pos 0x0 --output DP-0 --mode 2560x1440 --primary --rate 170 --pos 3840x0")
    -- Apply the wallpaper to each screen after monitor setup
    for s in screen do
        layout.set_wallpaper(s)
    end
end

-- Define available layouts
awful.layout.layouts = {
    awful.layout.suit.spiral.dwindle, -- Set spiral dwindle as the first option
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
}

layout.setup_titlebar = function(c)
    -- Default buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(awful.titlebar.widget.iconwidget(c))
    left_layout:buttons(buttons)

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(awful.titlebar.widget.floatingbutton(c))
    right_layout:add(awful.titlebar.widget.maximizedbutton(c))
    right_layout:add(awful.titlebar.widget.stickybutton(c))
    right_layout:add(awful.titlebar.widget.ontopbutton(c))
    right_layout:add(awful.titlebar.widget.closebutton(c))

    -- The title goes in the middle
    local title = awful.titlebar.widget.titlewidget(c)
    title:buttons(buttons)

    -- Now bring it all together
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(title)
    layout:set_right(right_layout)

    -- Set the titlebar for the client
    awful.titlebar(c):set_widget(layout)
end

-- Connect the titlebar setup to the appropriate signal
client.connect_signal("request::titlebars", layout.setup_titlebar)

return layout

