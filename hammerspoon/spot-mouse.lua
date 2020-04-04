local c = require('hs.canvas')
local eventtap = require('hs.eventtap')
local eventType = eventtap.event.types
local mouse = require('hs.mouse')
local timer = require('hs.timer')
local hotkey = require('hs.hotkey')
local screen = require('hs.screen')
local frame = screen.mainScreen():frame()
local statusMessage = require('status-message')

local hyper = {'alt', 'cmd', 'ctrl', 'shift'}
local a = nil

local circle = function(color)
  mouseLocation = { 
    x = event and event:location().x or mouse.getRelativePosition().x,
    y = event and event:location().y or mouse.getRelativePosition().y
  }
  return {
    type = 'circle',
    action = 'strokeAndFill',
    center = { x = mouseLocation.x, y = mouseLocation.y },
    fillColor = { hex = color, alpha = 0.5 },
    radius = '0.01',
    strokeColor = { white = 1 },
    strokeWidth = 4.0,
  }
end

local spotMouse = eventtap.new({ eventType.mouseMoved, eventType.leftMouseDown }, function(event)
  if event:getType() == 1 then
    a:removeElement(1)
    a:appendElements(circle('#ff0000')) 
    timer.doAfter(0.1, function()
      a:removeElement(1)
      a:appendElements(circle('#000000'))
    end)
  elseif event:getType() == 5 then
    a:removeElement(1)
    a:appendElements(circle('#000000'))
  end
end)

local spotMode = hotkey.modal.new(hyper, 39)

-- Enter modal with hyper-quote, exit with just quote
spotMode.entered = function()
  statusMessage.new('Spotting Mouse....'):alert()
  a = c.new({x = 0, y = 0, w = frame.w, h = frame.h }):show()
  a:appendElements(circle('#000000'))
  spotMouse:start()
end

spotMode:bind({}, 39, function()
  statusMessage.new('Stop Spotting Mouse....'):alert()
  spotMode:exit()
  spotMouse:stop()
  a:delete()
end)