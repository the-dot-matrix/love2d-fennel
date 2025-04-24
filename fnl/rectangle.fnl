(local Rectangle {})
(set Rectangle.__index Rectangle)

(fn Rectangle.new [self]
  (local rectangle (setmetatable {} self))
  (set rectangle.new nil)
  rectangle)

(fn Rectangle.load [self] 
  (set self.x (* (love.math.random) 500)))

(fn Rectangle.update [self dt]
  (set self.x (+ self.x (* 5 dt))))

(fn Rectangle.draw [self]
  (love.graphics.rectangle "line" self.x 50 200 150))

Rectangle
