-- The "hyper" key is a modifier combination used for creating hotkeys. This is
-- based on the Hammerspoon getting started guide and documentation. In blogs
-- and some gists (Github notes), the "hyper" key is set as `cmd+alt+ctrl+shift`,
-- but in the Hammerspoon getting started guide, the `cmd+alt+ctrl` combination
-- is used. Karabiner-Elements is used to remap the Right Command key to
-- `cmd+alt+ctrl` so I do not have to constantly hold down all the keys to invoke
-- the Hammerspoon-based window management functions. The following was added
-- to my Karabiner-Elements configuration file located at
-- `~/.config/karabiner/karabiner.json`. 
-- 
-- ```json
-- {
--     "description": "Change right command to hyper",
--     "manipulators": [
--         {
--             "from": {
--                 "key_code": "right_command",
--                 "modifiers": {
--                     "optional": [
--                         "any"
--                     ]
--                 }
--             },
--             "to": [
--                 {
--                     "key_code": "left_command",
--                     "modifiers": [
--                         "left_control",
--                         "left_option"
--                     ]
--                 }
--             ],
--             "type": "basic"
--         }
--     ]
-- },
-- ```
--
-- The documentation and instructions for adding a "hyper" key are not
-- well-defined for Karabiner-Elements v11. Most of the comments, issues, and
-- documentation are for Karabiner-Elements v0.90 and a custom build that adds
-- the "hyper" key to the simple modifications. The solution was to add
-- a custom complex modification.
--
-- Note, Karabiner-Elements has also been used to change the Caps Lock key to
-- Left Control if used in combination with another key and Escape if used
-- alone.

-- The [net-url](https://github.com/golgote/neturl) module is used to safely
-- and robustly parse file URLs. It is included here as the `url` module to
-- avoid having to minimize dependencies. This avoids having to install
-- luarocks and reinvent URL parsing.
url = require("url")

local hyper = {"cmd", "alt", "ctrl"}
local wf = hs.window.filter
-- TODO: Change this to a stack, so that multiple windows can be restored with successive calls to the shortcut
local most_recent_minimized_window = nil

wf.default:subscribe(wf.windowMinimized, function(window, application_name, cause) 
    most_recent_minimized_window = window
    most_recent_minimized_window = nill
end)

-- Set the dimensions of a window to fill the entire screen.
--
-- This might be the same `toggleZoom` method on the window
function fill_screen(win)
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end

-- Move window to left half of screen
hs.hotkey.bind(hyper, "H", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- Move window to right half of screen
hs.hotkey.bind(hyper, "L", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- Move window to upper half of screen
hs.hotkey.bind(hyper, "J", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)

-- Move window to lower half of screen
hs.hotkey.bind(hyper, "K", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)

-- Maximizes the current window. This does _not_ change the window to
-- Fullscreen, it just resizes the window to fill the screen. This is not
-- a toggle feature either, it only works one way, i.e. firing the shortcut
-- again does not unfill the screen.
hs.hotkey.bind(hyper, "M", function()
    local win = hs.window.focusedWindow()
    fill_screen(win)
end)

-- Maximize the most recently minimized window. This means unminizing the
-- window and resizing it to fill the screen.
hs.hotkey.bind(hyper, "N", function()
    if most_recent_minimized_window then
        fill_screen(mose_recent_minimized_window:unminimize())
    end
end)

-- Show a File/Folder selection dialog and write the path as a string back to
-- the window that originally had focus before the File/Folder selection dialog
-- was displayed. The goal is to provide an easy way to find a file or folder
-- when using a terminal to specify a path when the absolute path is not known
-- or relatively long to type. This provides a way to select a file or folder
-- in the middle of typing a command into the terminal.
hs.hotkey.bind(hyper, "C", function()
    local win = hs.window.focusedWindow()
    -- The `chooseFileOrFolder` returns a table with numbers as strings for the
    -- keys starting at one (1) for each path. The paths are URLs in the format
    -- of `file:///selected/path`. The URL needs to be converted to a path,
    -- i.e. the `file://` needs to be dropped.
    local paths = hs.dialog.chooseFileOrFolder("Select a File or Folder", "~", true, true, false)
    if paths then
        local path = url.parse(paths["1"]).path
        -- Refocus the previously focused window
        win:focus()
        -- Write the path as a key stroke
        hs.eventtap.keyStrokes(path)
        -- Also copy the path to the system clipboard (pasteboard)
        hs.pasteboard.setContents(path)
    end
end)

-- Reloads this file.
hs.hotkey.bind(hyper, "R", function()
    hs.reload()
end)

function reload_config(files)
    do_reload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            do_reload = true
        end
    end
    if do_reload then
        hs.reload()
    end
end

-- Reload this file if it is modified
my_watcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()

