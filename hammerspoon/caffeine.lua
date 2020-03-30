-- Delicious coffee for Mac (aka Caffeine app)
local caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
  if state then
    caffeine:setIcon('caffeine-on.pdf')
    caffeine:setTooltip('Computer currently prevented from going to sleep')
  else
    caffeine:setIcon('caffeine-off.pdf')
    caffeine:setTooltip('Computer currently allowed to go to sleep')
  end
end

function caffeineClicked()
  setCaffeineDisplay(hs.caffeinate.toggle('displayIdle'))
end

if caffeine then
  caffeine:setClickCallback(caffeineClicked)
  setCaffeineDisplay(hs.caffeinate.get('displayIdle'))
end

caffeineClicked()