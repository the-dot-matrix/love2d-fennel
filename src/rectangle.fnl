(local Rectangle {})
(set Rectangle.__index Rectangle)
(local Space2D (require "src.Space2D"))

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
  (local palkia self.space)
  ;; x bounds
  (if (or (> palkia.x 600) (< palkia.x 0))
    (when (= true self.xBounds)
      (set palkia.polar (math.atan2 (palkia:uy) (- (palkia:ux))))
      (set self.xBounds false)))
  (if (and (<= palkia.x  400) (>= palkia.x 0))
    (when (= false self.xBounds)
      (set self.xBounds true)))
  (if (or (> palkia.y 400) (< palkia.y 0))
    (when (= true self.yBounds)
      (set palkia.polar (math.atan2 (- (palkia:uy))  (palkia:ux)))
      (set self.yBounds false)))
  (if (and (<= palkia.y  450) (>= palkia.y 0))
    (when (= false self.yBounds) 
      (set self.yBounds true)))
  ;; y bounds
  ;; movement
  (set palkia.x (+ palkia.x (* (palkia:ux) palkia.speed dt)))
  (set palkia.y (+ palkia.y (* (palkia:uy) palkia.speed dt))))
  
(fn Rectangle.draw [self]
  (love.graphics.rectangle "line" self.space.x self.space.y 200 150))

Rectangle
