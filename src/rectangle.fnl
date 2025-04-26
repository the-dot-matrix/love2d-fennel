(local Rectangle {})
(set Rectangle.__index Rectangle)
(local Space2D (require "src.Space2D"))
(local Physics2D (require "src.Physics2D"))

(fn Rectangle.new [self]
  (local rectangle (setmetatable {} self))
;;(set rectangle.x (* (love.math.random) 200))
;;(set rectangle.y (* (love.math.random) 200))
;;(set rectangle.speed 300) 
;;(set rectangle.direction (* (love.math.random) (/ math.pi 2)))
  (let [xInit (+ (* (love.math.random) 200) 50)
    yInit (+ (* (love.math.random) 200) 50)
    speed 300
    direction (* (love.math.random) 2 math.pi)
    ; direction 0
    ]
  (set rectangle.space (Space2D:new xInit yInit speed direction)))
  (set rectangle.xBounds true)
  (set rectangle.yBounds true)
  rectangle)

(fn Rectangle.update [self dt]
  ;; x bounds
  (if (or (> self.space.x 600) (< self.space.x 0))
    (when (= true self.xBounds)
      (set self.space.polar (math.atan2 (self.space:uy) (- (self.space:ux))))
      (set self.xBounds false)))
  (if (and (<= self.space.x  400) (>= self.space.x 0))
    (when (= false self.xBounds)
      (set self.xBounds true)))
  (if (or (> self.space.y 400) (< self.space.y 0))
    (when (= true self.yBounds)
      (set self.space.polar (math.atan2 (- (self.space:uy))  (self.space:ux)))
      (set self.yBounds false)))
  (if (and (<= self.space.y  450) (>= self.space.y 0))
    (when (= false self.yBounds) 
      (set self.yBounds true)))
  ;; y bounds
  ;; movement
  ; (set self.space.x (+ self.space.x (* (self.space:ux) self.space.speed dt)))
  ; (set self.space.y (+ self.space.y (* (self.space:uy) self.space.speed dt)))
  (Physics2D.move self dt)
  )
  
(fn Rectangle.draw [self]
  (love.graphics.rectangle "line" self.space.x self.space.y 200 150))

Rectangle
