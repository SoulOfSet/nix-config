-- ~/.config/awesome/modules/bindings.lua

local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local variables = require("modules.variables")

local bindings = {}

-- Global keybindings
bindings.globalkeys = gears.table.join(
    -- Awesome WM specific keybindings
    awful.key({ variables.modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ variables.modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ variables.modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ variables.modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ variables.modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ variables.modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ variables.modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ variables.modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ variables.modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ variables.modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ variables.modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ variables.modkey,           }, "Return", function () awful.spawn(variables.terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ variables.modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ variables.modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ variables.modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ variables.modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ variables.modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ variables.modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ variables.modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ variables.modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ variables.modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ variables.modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ variables.modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ variables.modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ variables.modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),

    -- Additional key bindings ported from Hyprland
    awful.key({ variables.modkey,           }, "q", function () awful.spawn("alacritty") end,
              {description = "launch alacritty", group = "launcher"}),

    awful.key({ variables.modkey,           }, "c", function () if client.focus then client.focus:kill() end end,
              {description = "close focused client", group = "client"}),

    awful.key({ variables.modkey,           }, "m", function () awesome.quit() end,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ variables.modkey,           }, "e", function () awful.spawn("dolphin") end,
              {description = "launch dolphin", group = "launcher"}),

    awful.key({ variables.modkey,           }, "f", function (c)
        c.floating = not c.floating
        c:raise()
    end,
    {description = "toggle floating", group = "client"}),

    awful.key({ variables.modkey,           }, "r", function () awful.spawn("rofi -show drun") end,
              {description = "run rofi", group = "launcher"}),

    awful.key({ "Mod1",           }, "Tab", function () awful.spawn("rofi -show window") end,
              {description = "run rofi window switcher", group = "launcher"}),

    awful.key({ variables.modkey,           }, "p", function ()
        -- Implement pseudotile logic if needed
    end,
    {description = "pseudotile", group = "layout"}),

    awful.key({ variables.modkey,           }, "j", function ()
        -- Implement togglesplit logic if needed
    end,
    {description = "toggle split", group = "layout"}),

    -- Move focus with modkey + arrow keys
    awful.key({ variables.modkey,           }, "Left",   function () awful.screen.focus_bydirection("left") end,
          {description = "focus left monitor", group = "screen"}),
    awful.key({ variables.modkey,           }, "Right",  function () awful.screen.focus_bydirection("right") end,
          {description = "focus right monitor", group = "screen"}),
    
    -- Switch workspaces with modkey + [0-9]
    awful.key({ variables.modkey }, "1", function () local screen = awful.screen.focused(); local tag = screen.tags[1]; if tag then tag:view_only() end end,
              {description = "view tag 1", group = "tag"}),
    awful.key({ variables.modkey }, "2", function () local screen = awful.screen.focused(); local tag = screen.tags[2]; if tag then tag:view_only() end end,
              {description = "view tag 2", group = "tag"}),
    awful.key({ variables.modkey }, "3", function () local screen = awful.screen.focused(); local tag = screen.tags[3]; if tag then tag:view_only() end end,
              {description = "view tag 3", group = "tag"}),
    awful.key({ variables.modkey }, "4", function () local screen = awful.screen.focused(); local tag = screen.tags[4]; if tag then tag:view_only() end end,
              {description = "view tag 4", group = "tag"}),
    awful.key({ variables.modkey }, "5", function () local screen = awful.screen.focused(); local tag = screen.tags[5]; if tag then tag:view_only() end end,
              {description = "view tag 5", group = "tag"}),
    awful.key({ variables.modkey }, "6", function () local screen = awful.screen.focused(); local tag = screen.tags[6]; if tag then tag:view_only() end end,
              {description = "view tag 6", group = "tag"}),
    awful.key({ variables.modkey }, "7", function () local screen = awful.screen.focused(); local tag = screen.tags[7]; if tag then tag:view_only() end end,
              {description = "view tag 7", group = "tag"}),
    awful.key({ variables.modkey }, "8", function () local screen = awful.screen.focused(); local tag = screen.tags[8]; if tag then tag:view_only() end end,
              {description = "view tag 8", group = "tag"}),
    awful.key({ variables.modkey }, "9", function () local screen = awful.screen.focused(); local tag = screen.tags[9]; if tag then tag:view_only() end end,
              {description = "view tag 9", group = "tag"}),

    -- Move active window to a workspace with modkey + Shift + [0-9]
    awful.key({ variables.modkey, "Shift" }, "1", function () if client.focus then local tag = client.focus.screen.tags[1]; if tag then client.focus:move_to_tag(tag) end end end,
              {description = "move focused client to tag 1", group = "tag"}),
    awful.key({ variables.modkey, "Shift" }, "2", function () if client.focus then local tag = client.focus.screen.tags[2]; if tag then client.focus:move_to_tag(tag) end end end,
              {description = "move focused client to tag 2", group = "tag"}),
    awful.key({ variables.modkey, "Shift" }, "3", function () if client.focus then local tag = client.focus.screen.tags[3]; if tag then client.focus:move_to_tag(tag) end end end,
              {description = "move focused client to tag 3", group = "tag"}),
    awful.key({ variables.modkey, "Shift" }, "4", function () if client.focus then local tag = client.focus.screen.tags[4]; if tag then client.focus:move_to_tag(tag) end end end,
              {description = "move focused client to tag 4", group = "tag"}),
    awful.key({ variables.modkey, "Shift" }, "5", function () if client.focus then local tag = client.focus.screen.tags[5]; if tag then client.focus:move_to_tag(tag) end end end,
              {description = "move focused client to tag 5", group = "tag"}),
    awful.key({ variables.modkey, "Shift" }, "6", function () if client.focus then local tag = client.focus.screen.tags[6]; if tag then client.focus:move_to_tag(tag) end end end,
              {description = "move focused client to tag 6", group = "tag"}),
    awful.key({ variables.modkey, "Shift" }, "7", function () if client.focus then local tag = client.focus.screen.tags[7]; if tag then client.focus:move_to_tag(tag) end end end,
              {description = "move focused client to tag 7", group = "tag"}),
    awful.key({ variables.modkey, "Shift" }, "8", function () if client.focus then local tag = client.focus.screen.tags[8]; if tag then client.focus:move_to_tag(tag) end end end,
              {description = "move focused client to tag 8", group = "tag"}),
    awful.key({ variables.modkey, "Shift" }, "9", function () if client.focus then local tag = client.focus.screen.tags[9]; if tag then client.focus:move_to_tag(tag) end end end,
              {description = "move focused client to tag 9", group = "tag"}),

    -- Screenshot
    awful.key({}, "Print", function () awful.spawn("grim -g \"$(slurp)\"") end,
              {description = "take a screenshot", group = "launcher"}),

    -- Brightness
    awful.key({}, "XF86MonBrightnessUp", function () awful.spawn.with_shell("$HOME/.local/bin/adjust_brightness up") end,
              {description = "increase brightness", group = "launcher"}),
    awful.key({}, "XF86MonBrightnessDown", function () awful.spawn.with_shell("$HOME/.local/bin/adjust_brightness down") end,
              {description = "decrease brightness", group = "launcher"}),

    -- Audio Control
    awful.key({}, "XF86AudioRaiseVolume", function () awful.spawn("pamixer --increase 5 --allow-boost false") end,
              {description = "raise volume", group = "launcher"}),
    awful.key({}, "XF86AudioLowerVolume", function () awful.spawn("pamixer --decrease 5") end,
              {description = "lower volume", group = "launcher"}),
    awful.key({}, "XF86AudioMute", function () awful.spawn("pamixer --toggle-mute") end,
              {description = "mute/unmute audio", group = "launcher"}),
    awful.key({}, "XF86AudioPlay", function () awful.spawn("playerctl play-pause") end,
              {description = "play/pause audio", group = "launcher"})
)

-- Client keybindings
bindings.clientkeys = gears.table.join(
    awful.key({ variables.modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ variables.modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ variables.modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ variables.modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ variables.modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ variables.modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ variables.modkey,           }, "n",
        function (c)
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ variables.modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ variables.modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ variables.modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Mouse buttons on the client
bindings.clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ variables.modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ variables.modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

return bindings

