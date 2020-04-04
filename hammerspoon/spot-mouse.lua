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

-- Define circle attributes that will highlight the mouse/cursor
local circle = function(color)
  mouseLocation = { 
    x = mouse.getRelativePosition().x,
    y = mouse.getRelativePosition().y
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

-- Watch mouse movements and mouse clicks
local spotMouse = eventtap.new({ eventType.mouseMoved, eventType.leftMouseDown }, function(event)
  -- Event type 1 is mouse click
  if event:getType() == 1 then
    -- Remove previous circle before drawing new one
    a:removeElement(1)
    -- Change circle color to red and then change back to original color
    a:appendElements(circle('#ff0000')) 
    timer.doAfter(0.1, function()
      a:removeElement(1)
      a:appendElements(circle('#000000'))
    end)
  -- Event type 5 is mouse movement
  elseif event:getType() == 5 then
    -- Remove previous circle before drawing new one
    a:removeElement(1)
    a:appendElements(circle('#000000'))
  end
end)

-- Enter modal with hyper-quote
local spotMode = hotkey.modal.new(hyper, 39)

-- Create new canvas and draw circle around mouse as soon as modal is activated
spotMode.entered = function()
  statusMessage.new('Spotting Mouse....'):alert()
  a = c.new({x = 0, y = 0, w = frame.w, h = frame.h }):show()
  a:appendElements(circle('#000000'))
  spotMouse:start()
end

-- Exit modal, stop watching events and delete canvas
spotMode:bind({}, 39, function()
  statusMessage.new('Stop Spotting Mouse....'):alert()
  spotMode:exit()
  spotMouse:stop()
  a:delete()
end)