local eventtap = require('hs.eventtap')
local hotkey = require('hs.hotkey')
local screen = require('hs.screen')
local window = require('hs.window')
local statusMessage = require('status-message')

local normal = hotkey.modal.new({'ctrl'}, '[')
normal.entered = function()
  hs.alert('Normal Mode')
end

normal.exited = function()
  hs.alert('Insert Mode')
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

normal:bind({}, '/', function()
  eventtap.keyStroke({'cmd'}, 'F')
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