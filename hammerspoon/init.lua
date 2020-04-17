require('caffeine')
require('window-manager')
require('spot-mouse')
local application = require('hs.application')
local fnutils = require('hs.fnutils')
local hotkey = require('hs.hotkey')
local inspect = require('hs.inspect')
local pathwatcher = require('hs.pathwatcher')
local window = require('hs.window')
local statusMessage = require('status-message')

local mash = {'alt', 'cmd', 'ctrl'}
local hyper = {'alt', 'cmd', 'ctrl', 'shift'}

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
pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/init.lua', reloadConfig):start()
pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/window-manager.lua', reloadConfig):start()
pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/status-message.lua', reloadConfig):start()
statusMessage.new('Why a spoon, cousin? Why not an axe?'):alert()
-- hs.notify.new({title='Hammerspoon', informativeText='Why a spoon, cousin? Why not an axe?'}):send()

-- Reload config manually
hotkey.bind(hyper, 'r', hs.reload)

-- Raise Hammerspoon console to front
hotkey.bind(hyper, 'k', hs.toggleConsole)

-- Force mute input device
hotkey.bind(hyper, 'x', function() 
  local input = hs.audiodevice.defaultInputDevice()
  input:setInputMuted(not input:inputMuted())
end)

-- Switching windows through hints
hotkey.bind(hyper, '\\', hs.hints.windowHints)

--------------------------
-- Application Launcher --
--------------------------

local appBindings = {
  { key = 'space', app = 'iTerm' },
  { key = 'a', app = '' },
  { key = 'b', app = 'Firefox' },
  { key = 'c', app = 'Google Chrome' },
  { key = 'd', app = 'Dash' },
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
  -- hyper-w launches system wifi diagnostics. Remapped to hyper-f20 in Karabiner-Elements
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

fnutils.each(appBindings, function(object)
  if object.app ~= '' then
    hotkey.bind(hyper, object.key, function()
      application.launchOrFocus(object.app)
    end)
  end
end)