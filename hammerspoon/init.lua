require 'caffeine'
local statusMessage = require 'status-message'
local windowManager = require 'window-manager'
local inspect = require 'lib.inspect'
local hf = require 'helper-functions'

local mash = {'alt', 'cmd', 'ctrl'}
local hyper = {'alt', 'cmd', 'ctrl', 'shift'}

-- Disable animations
hs.window.animationDuration = 0

-- Reload init.lua automatically on config changes
function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == '.lua' then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end

-- Set paths to watch for changes
hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/init.lua', reloadConfig):start()
hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/window-manager.lua', reloadConfig):start()
hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/status-message.lua', reloadConfig):start()
statusMessage.new('Why a spoon, cousin? Why not an axe?', 40):alert()
-- hs.notify.new({title='Hammerspoon', informativeText='Why a spoon, cousin? Why not an axe?'}):send()

-- Reload config manually
hs.hotkey.bind(hyper, 'r', function()
  hs.reload()
end)

-- Raise Hammerspoon console to front
hs.hotkey.bind(hyper, 'k', function()
  hs.console.hswindow():raise()
end)

-- Force mute input device
hs.hotkey.bind(hyper, 'i', function() 
  local input = hs.audiodevice.defaultInputDevice()
  input:setInputMuted(not input:inputMuted())
end)

-- Switching windows through hints
hs.hotkey.bind(hyper, '\\', function()
  hs.hints.windowHints()
end)

--------------------------
-- Application Launcher --
--------------------------
hs.hotkey.bind(hyper, 'space', function()
  hs.application.launchOrFocus('iTerm')
end)

hs.hotkey.bind(hyper, 'b', function()
  hs.application.launchOrFocus('Firefox')
end)

hs.hotkey.bind(hyper, 'c', function()
  hs.application.launchOrFocus('Google Chrome')
end)

hs.hotkey.bind(hyper, 'e', function()
  hs.application.launchOrFocus('Spark')
end)

hs.hotkey.bind(hyper, 'f', function()
  hs.application.launchOrFocus('Finder')
end)

hs.hotkey.bind(hyper, 'n', function()
  hs.application.launchOrFocus('nvALT')
end)

hs.hotkey.bind(hyper, 's', function()
  hs.application.launchOrFocus('Safari')
end)

hs.hotkey.bind(hyper, 'v', function()
  hs.application.launchOrFocus('Visual Studio Code')
end)

--hs.hotkey.bind(hyper, 'up', function()
  --local currentWindow = hs.window.focusedWindow()
  --hs.application.launchOrFocus('Firefox')
  --hs.eventtap.keyStroke({'ctrl'}, 'u')
  --hs.window.focus(currentWindow)
--end)

--hs.hotkey.bind(hyper, 'down', function()
  --local currentWindow = hs.window.focusedWindow()
  --hs.application.launchOrFocus('Firefox')
  --hs.eventtap.keyStroke({'ctrl'}, 'd')
  --hs.window.focus(currentWindow)
--end)

--hs.hotkey.bind(hyper, 'right', function()
  --local currentWindow = hs.window.focusedWindow()
  --hs.application.launchOrFocus('Firefox')
  --hs.eventtap.keyStroke({}, ']')
  --hs.eventtap.keyStroke({}, ']')
  --hs.window.focus(currentWindow)
--end)

--hs.hotkey.bind(hyper, 'left', function()
  --local currentWindow = hs.window.focusedWindow()
  --hs.application.launchOrFocus('Firefox')
  --hs.eventtap.keyStroke({}, '[')
  --hs.eventtap.keyStroke({}, '[')
  --hs.window.focus(currentWindow)
--end)