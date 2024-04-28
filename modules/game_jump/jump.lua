
-- Window functions

hidden = true
function init() -- Start up logic
  g_ui.importStyle('jump')

  jumpMenuButton = modules.client_topmenu.addLeftGameButton('jumpMenuButton', tr('Jump Menu'), '/images/topbuttons/questlog', toggle)
 
  jumpWindow = g_ui.createWidget('JumpWindow', rootWidget)
  
  button = jumpWindow:getChildByIndex(1)
  
  jumpUpdate()
  
  hide()

  connect(g_game, { onGameEnd = destroyWindows})
end

function terminate() -- Close logic
  disconnect(g_game, { onGameEnd = destroyWindows})

  destroy()
  jumpMenuButton:destroy()
end

function destroy() -- Clear the window
  if jumpWindow then
    jumpWindow:destroy()
    jumpWindow = nil
  end
end

function hide()
  jumpWindow:hide()
  hidden = true
end

function show()
  jumpWindow:show()
  jumpWindow:raise()
  jumpWindow:focus()
  hidden = false
end

function toggle() -- Used to switch between diding and showing the window
  if jumpWindow:isVisible() then
    hide()
  else
    show()
  end
end

function jumpUpdate()
if hidden == false then -- When the window is hidden, don't move
local x = button:getX()
local y = button:getY()

if x > 250 then -- If we hit the end

button:move(x - 10, y)

else

jump()          -- jump

end

end
return scheduleEvent(modules.game_jump.jumpUpdate, 100)
end

function jump() -- Reset x and give y and new random value - JUMP!

local rand = math.random(110, 440)

button:move(500, rand)
end