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
hs.hotkey.bind(hyper, 'x', function() 
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

local appBindings = {
  { key = 'space', app = 'iTerm' },
  { key = 'a', app = '' },
  { key = 'b', app = 'Firefox' },
  { key = 'c', app = 'Google Chrome' },
  { key = 'd', app = '' },
  { key = 'e', app = 'Spark' },         -- Email
  { key = 'f', app = 'Finder' },
  { key = 'g', app = '' },
  { key = 'h', app = '' },
  { key = 'i', app = 'IINA' },
  { key = 'j', app = '' },
  -- Used to raise hammerspoon console
  -- { key = 'k', app = '' },
  { key = 'l', app = '' },
  { key = 'm', app = 'Spotify' },       -- Music
  { key = 'n', app = '' },
  { key = 'o', app = '' },
  { key = 'p', app = '' },
  { key = 'q', app = '' },
  -- Used to reload hammerspoon config
  -- { key = 'r', app = '' },
  { key = 's', app = 'Safari' },
  { key = 't', app = '' },
  { key = 'u', app = '' },
  { key = 'v', app = 'Visual Studio Code' },
  -- hyper-w launches system wifi diagnostics. Remapped to hyper-f24 in Karabiner-Elements
  { key = 'f20', app = 'Microsoft Word' },
  -- Used to force mute mic
  -- { key = 'x', app = '' },
  { key = 'y', app = '' },
  { key = 'z', app = '' },
  { key = '1', app = '' },
  { key = '2', app = '' },
  { key = '3', app = '' },
  { key = '4', app = '' },
  { key = '5', app = '' },
  { key = '6', app = '' },
  { key = '7', app = '' },
  { key = '8', app = '' },
  { key = '9', app = '' },
  { key = '0', app = '' },
}

hs.fnutils.each(appBindings, function(object)
  if object.app ~= '' then
    hs.hotkey.bind(hyper, object.key, function()
      hs.application.launchOrFocus(object.app)
    end)
  end
end)