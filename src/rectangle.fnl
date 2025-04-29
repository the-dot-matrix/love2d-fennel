(local Rectangle {})
(set Rectangle.__index Rectangle)
(local Space2D (require "src.Space2D"))
(local Physics2D (require "src.Physics2D"))

(fn Rectangle.new [self]
  (local rectangle (setmetatable {} self))
  (let [xInit (+ (* (love.math.random) 200) 50)
    yInit (+ (* (love.math.random) 200) 50)
    speed (+ (* (love.math.random) 400) 100)
    direction (* (love.math.random) 2 math.pi)
    ]
  (Space2D rectangle xInit yInit speed direction))
  (Physics2D rectangle)
  (set rectangle.xBounds true)
  (set rectangle.yBounds true)
  rectangle)

(fn Rectangle.update [self dt]
  (self.boundaryBounce self)
  (self.move self dt))
  
(fn Rectangle.draw [self]
  (love.graphics.rectangle "line" self.x self.y 200 150))

Rectangle
