local Rectangle = require("lua.rectangle")
local rectangleA = Rectangle:new()
local rectangleB = Rectangle:new()
function love.load()
  local w, h = love.graphics.getDimensions()
  love.window.updateMode(w, h, {vsync = false})
  rectangleA:load()
  return rectangleB:load()
end
function love.update(dt)
  rectangleA:update(dt)
  return rectangleB:update(dt)
end
function love.draw()
  rectangleA:draw()
  rectangleB:draw()
  return love.graphics.print(("lua:\t" .. love.timer.getFPS()))
end
return love.draw 
