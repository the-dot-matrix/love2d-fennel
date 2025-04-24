local Rectangle = {}
Rectangle.__index = Rectangle
function Rectangle:new ()
  local rectangle = setmetatable({}, self)
  rectangle.new = nil
  return rectangle
end
function Rectangle:load ()
  self.x = (love.math.random() * 500)
end
function Rectangle:update (dt)
  self.x = (self.x + (5 * dt))
end
function Rectangle:draw ()
  return love.graphics.rectangle("line", self.x, 50, 200, 150)
end
return Rectangle