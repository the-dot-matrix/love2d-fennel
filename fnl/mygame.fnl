(local Rectangle (require "fnl.rectangle"))
(local rectangleA (Rectangle:new))
(local rectangleB (Rectangle:new))

(fn love.load []
  (let [(w h) (love.graphics.getDimensions)]
    (love.window.updateMode w h {"vsync" false}))
  (rectangleA:load)
  (rectangleB:load))

(fn love.update [dt] 
  (rectangleA:update dt)
  (rectangleB:update dt))

(fn love.draw []
  (rectangleA:draw)
  (rectangleB:draw)
  (love.graphics.print (.. "fnl:\t" (love.timer.getFPS))))
