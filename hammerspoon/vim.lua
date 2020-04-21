local eventtap = require('hs.eventtap')
local hotkey = require('hs.hotkey')
local screen = require('hs.screen')
local window = require('hs.window')
local statusMessage = require('status-message')

local normalStatus = statusMessage.new('Normal Mode')

local normal = hotkey.modal.new({'ctrl'}, '[')
normal.entered = function()
  normalStatus:show()
end

normal.exited = function()
  normalStatus:hide()
end

normal:bind({}, 'i', function()
    normal:exit()
end)

normal:bind({}, 'h', function()
  eventtap.keyStroke({}, 'Left')
end)

normal:bind({}, 'j', function()
  eventtap.keyStroke({}, 'Down')
end)

normal:bind({}, 'k', function()
  eventtap.keyStroke({}, 'Up')
end)

normal:bind({}, 'l', function()
  eventtap.keyStroke({}, 'Right')
end)

normal:bind({}, 'e', function()
  eventtap.keyStroke({'alt'}, 'Right')
end)

normal:bind({}, 'w', function()
  eventtap.keyStroke({'alt'}, 'Right')
  eventtap.keyStroke({}, 'Right')
end)

normal:bind({}, 'b', function()
  eventtap.keyStroke({'alt'}, 'Left')
end)

normal:bind({}, '/', function()
  eventtap.keyStroke({'cmd'}, 'f')
end)

normal:bind({}, 'u', function()
  eventtap.keyStroke({'cmd'}, 'z')
end)

normal:bind({'ctrol'}, 'r', function()
  eventtap.keyStroke({'cmd', 'shift'}, 'z')
end)