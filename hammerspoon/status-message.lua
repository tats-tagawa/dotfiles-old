local drawing = require 'hs.drawing'
local geometry = require 'hs.geometry'
local screen = require 'hs.screen'
local styledtext = require 'hs.styledtext'

local frame = screen.mainScreen():frame()

local statusMessage = {}

statusMessage.new = function(message, textSize)
  textSize = textSize or 24
  local styledTextAttributes = {
    font = { size = textSize },
    color = { white = 1 }
  }
  local styledText = styledtext.new(message, styledTextAttributes)

  local styledTextSize = drawing.getTextDrawingSize(styledText)

  local textRect = {
    x = frame.w - styledTextSize.w - 15,
    y = frame.h - styledTextSize.h - 15,
    w = styledTextSize.w + 5,
    h = styledTextSize.h + 5
  }
  local text = drawing.text(textRect, styledText)

  local backgroundRect = {
    x = frame.w - styledTextSize.w - 25,
    y = frame.h - styledTextSize.h - 20,
    w = styledTextSize.w + 20,
    h = styledTextSize.h + 10
  }
  local background = drawing.rectangle(backgroundRect)

  background:setRoundedRectRadii(5, 5)
  background:setFillColor({ red = 0, green = 0, blue = 0, alpha=0.6 })
  background:setStroke(true):setStrokeColor({ white = 1 }):setStrokeWidth(2)

  return {
    show = function()
      background:show()
      text:show()
    end,
    hide = function()
      background:hide()
      text:hide()
    end,
    alert = function()
      background:setStroke(true):setStrokeColor({ white = 1 }):setStrokeWidth(6)
      background:show()
      text:show()
      hs.timer.delayed.new(4, function()
        background:hide()
        text:hide()
      end):start()
    end
  }
end

return statusMessage