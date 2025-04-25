(local Rectangle {})
(set Rectangle.__index Rectangle)

(fn Rectangle.new [self]
  (local rectangle (setmetatable {} self))
  (set rectangle.x (* (love.math.random) 200))
  (set rectangle.speed 100)
  rectangle)

(fn Rectangle.update [self dt]
  (when (< self.x 600)
    (set self.x (+ self.x (* self.speed dt)))))

(fn Rectangle.draw [self]
  (love.graphics.rectangle "line" self.x 50 200 150))

Rectangle
