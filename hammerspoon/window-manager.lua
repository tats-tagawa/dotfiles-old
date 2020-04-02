local statusMessage = require 'status-message'

local mash = {'alt', 'cmd', 'ctrl'}
local hyper = {'alt', 'cmd', 'ctrl', 'shift'}

local windowMode = hs.hotkey.modal.new()

local inWindowModeState = false
hs.hotkey.bind(hyper, 'return', function() 
  if not inWindowModeState then
    windowMode:enter()
    inWindowModeState = true
  else
    windowMode:exit()
    inWindowModeState = false
  end
end)

local windowStatusMessage = statusMessage.new('Window Mode')
windowMode.entered = function() 
  windowStatusMessage:show()
end

windowMode.exited = function()
  windowStatusMessage:hide()
end

-- 50% width, left
windowMode:bind({}, 'j', function()
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

-- 50% width, right
windowMode:bind({}, 'l', function()
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

-- 1/3 width, left
windowMode:bind({}, '7', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 3
  f.h = max.h
  win:setFrame(f)
end)

-- 1/3 width, center
windowMode:bind({}, '8', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 3)
  f.y = max.y
  f.w = max.w / 3
  f.h = max.h
  win:setFrame(f)
end)

-- 1/3 width, right
windowMode:bind({}, '9', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * (2 / 3))
  f.y = max.y
  f.w = max.w / 3
  f.h = max.h
  win:setFrame(f)
end)

-----

-- 2/3 width, left half
windowMode:bind({}, 'u', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w * (2 / 3)
  f.h = max.h
  win:setFrame(f)
end)

-- 2/3 width, right half
windowMode:bind({}, 'o', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 3)
  f.y = max.y
  f.w = max.w * (2/3)
  f.h = max.h
  win:setFrame(f)
end)

-- 2/3 width, centered
windowMode:bind({}, 'i', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 6)
  f.y = max.y
  f.w = max.w * (2/3)
  f.h = max.h
  win:setFrame(f)
end)
-----

-- 100% width
windowMode:bind({}, 'k', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

-- 2/3 height, top
windowMode:bind({}, '1', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h * (2/3)
  win:setFrame(f)
end)

-- 1/3 height, bottom
windowMode:bind({}, '2', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h - (max.h / 3))
  f.w = max.w
  f.h = max.h * (1/3)
  win:setFrame(f)
end)

-- Quarter top left
windowMode:bind({}, 'q', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w * (1/2)
  f.h = max.h * (1/2)
  win:setFrame(f)
end)

-- Quarter bottom left
windowMode:bind({}, 'z', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h * 1/2)
  f.w = max.w * (1/2)
  f.h = max.h * (1/2)
  win:setFrame(f)
end)

-- Quarter top right
windowMode:bind({}, 'e', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 1/2)
  f.y = max.y
  f.w = max.w * (1/2)
  f.h = max.h * (1/2)
  win:setFrame(f)
end)

-- Quarter bottom right
windowMode:bind({}, 'c', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 1/2)
  f.y = max.y + (max.h * 1/2)
  f.w = max.w * (1/2)
  f.h = max.h * (1/2)
  win:setFrame(f)
end)
local increment = hs.screen.mainScreen():frame().w * 0.05

-- Increase width left
windowMode:bind({}, 'a', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  if f.x ~= 0 then
    hs.alert(f.x)
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
  local win = hs.window.focusedWindow()
  local f = win:frame()
  hs.alert('Calculated ' .. f.w - increment)
  hs.alert('Width ' .. f.w)
  if f.w - increment ~= f.w then
    f.x = f.x + increment
    f.w = f.w - increment
  end
  win:setFrame(f)
end)

-- Increase width right
windowMode:bind({}, 'd', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.w = f.w + increment
  win:setFrame(f)
end)

-- Move to right screen
windowMode:bind({}, 'Right', function()
  hs.window.focusedWindow():moveOneScreenEast()
end)

-- Move to left screen
windowMode:bind({}, 'Left', function()
  hs.window.focusedWindow():moveOneScreenWest()
end)