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
  (Physics2D.classInheritor rectangle)
  (set rectangle.mode "line")
  (set rectangle.xBounds true)
  (set rectangle.yBounds true)
  (set rectangle.width 50)
  (set rectangle.height 75)
  (set rectangle.xCenter (fn [self] (+ self.x (/ self.width 2))))
  (set rectangle.yCenter (fn [self] (+ self.y (/ self.height 2))))
  (set rectangle.right (fn [self] (+ self.x self.width)))
  (set rectangle.down (fn [self] (+ self.y self.height)))
  (set rectangle.left (fn [self] self.x))
  (set rectangle.up (fn [self] self.y))

  rectangle)

(fn Rectangle.update [self dt]
  (self.boundaryBounce self)
  (self.move self dt))
  
(fn Rectangle.draw [self]
  (love.graphics.rectangle self.mode self.x self.y self.width self.height))

; (when (and self.collide object.collide) 
;         (set self.polar (math.atan2 (- (self:uy)) (- (self:ux))))
;         (set object.polar (math.atan2 (- (object:uy)) (- (object:ux))))
;         (set self.collide false)
;         (set object.collide false))
;       (when false
;         (set self.collide true)
;         (set object.collide true))
      

(fn Rectangle.overlapDetector [self object]
  (var result false)
  (if (= true (and (> (self:right) (object:left)) (< (self:left) (object:right))
      (> (self:down) (object:up)) (< (self:up) (object:down))))
      (set result true))
  result)



Rectangle
