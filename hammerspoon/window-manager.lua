local hotkey = require('hs.hotkey')
local screen = require('hs.screen')
local window = require('hs.window')
local statusMessage = require('status-message')

local hyper = {'alt', 'cmd', 'ctrl', 'shift'}

-- Disable animations
window.animationDuration = 0

-- Enter modal with hyper-return, exit with just return
local windowMode = hotkey.modal.new(hyper, 'return')
windowMode:bind({}, 'return', function()
  windowMode:exit()
end)

-- Show if in window mode
local windowStatusMessage = statusMessage.new('Window Mode')
windowMode.entered = function() 
  windowStatusMessage:show()
end

windowMode.exited = function()
  windowStatusMessage:hide()
end

-- set where to move window and what size
-- x-position, y-position, width, height where 1 = screen size
-- x and y-position are from 0 (top left) to 1 (bottom right)
-- width and height are from 0 (minimum size) to 1 (maximum size)
function moveWindow(x, y, w, h)
  return function()
    local win = window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w * x)
    f.y = max.h * y
    f.w = max.w * w
    f.h = max.h * h
    win:setFrame(f)  
  end
end

-- Full screen
windowMode:bind({}, 'k', moveWindow(0, 0, 1, 1))

-- 1/2 width, left
windowMode:bind({}, 'j', moveWindow(0, 0, 0.5, 1))
-- 1/2 width, right
windowMode:bind({}, 'l', moveWindow(0.5, 0, 0.5, 1))

-- 1/3 width, left
windowMode:bind({}, '7', moveWindow(0, 0, 0.33, 1))
-- 1/3 width, center
windowMode:bind({}, '8', moveWindow(0.33, 0, 0.33, 1))
-- 1/3 width, right
windowMode:bind({}, '9', moveWindow(0.66, 0, 0.33, 1))

-- 2/3 width, left half
windowMode:bind({}, 'u', moveWindow(0, 0, 0.66, 1))
-- 2/3 width, right half
windowMode:bind({}, 'o', moveWindow(0.33, 0, 0.66, 1))
-- 2/3 width, centered
windowMode:bind({}, 'i', moveWindow(0.166, 0, 0.66, 1))

-- Quarter top left
windowMode:bind({}, 'q', moveWindow(0, 0, 0.5, 0.5))
-- Quarter top right
windowMode:bind({}, 'e', moveWindow(0.5, 0, 0.5, 0.5))
-- Quarter bottom right
windowMode:bind({}, 'c', moveWindow(0.5, 0.5, 0.5, 0.5))
-- Quarter bottom left
windowMode:bind({}, 'z', moveWindow(0, 0.5, 0.5, 0.5))

local increment = screen.mainScreen():frame().w * 0.05

-- Increase width left
windowMode:bind({}, 'a', function()
  local win = window.focusedWindow()
  local f = win:frame()
  if f.x ~= 0 then
    if f.x >= increment then
      f.x = f.x - increment
      f.w = f.w + increment
    elseif f.x < increment then
      f.w = f.w + increment
      f.x = 0
    end
  end
  win:setFrame(f)
end)

-- Decrease width left
windowMode:bind({}, 's', function()
  local win = window.focusedWindow()
  local f = win:frame()
  if f.w - increment ~= f.w then
    f.x = f.x + increment
    f.w = f.w - increment
  end
  win:setFrame(f)
end)

-- Increase width right
windowMode:bind({}, 'd', function()
  local win = window.focusedWindow()
  local f = win:frame()
  f.w = f.w + increment
  win:setFrame(f)
end)

-- Move to right screen
windowMode:bind({}, 'Right', function()
  window.focusedWindow():moveOneScreenEast()
end)

-- Move to left screen
windowMode:bind({}, 'Left', function()
  window.focusedWindow():moveOneScreenWest()
end)