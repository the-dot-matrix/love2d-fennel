(local Rectangle {})
(set Rectangle.__index Rectangle)

(fn Rectangle.new [self]
  (local rectangle (setmetatable {} self))
  (set rectangle.new nil)
  rectangle
  )

(fn Rectangle.load [self] 
  (set self.x (* (love.math.random) 200))
  (set self.speed 100)
  )

(fn Rectangle.update [self dt]
  (set self.x (+ self.x (* self.speed dt)))
  )

(fn Rectangle.draw [self]
  (love.graphics.rectangle "line" self.x 50 200 150)
  )

Rectangle
