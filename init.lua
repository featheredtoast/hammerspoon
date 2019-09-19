local hyper = {"ctrl", "alt", "cmd"}
local shift_hyper = { 'shift', 'ctrl', 'cmd', 'alt'}

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0
spoon.MiroWindowsManager:bindHotkeys({
    up = {hyper, "up"},
    right = {hyper, "right"},
    down = {hyper, "down"},
    left = {hyper, "left"},
    fullscreen = {hyper, "f"}
})

-- move focused window to other screen
hs.hotkey.bind(shift_hyper, 'right', function() hs.window.focusedWindow():moveOneScreenEast(true, true) end)
hs.hotkey.bind(shift_hyper, 'left', function() hs.window.focusedWindow():moveOneScreenWest(true, true) end)

-- Send all windows to the main screen
hs.hotkey.bind(shift_hyper, 'm', function()
                 screen = hs.screen.mainScreen()
                 windows = hs.window.allWindows()
                 for i, window in ipairs(windows) do
                   window:moveToScreen(screen, false, true)
                 end
end)
