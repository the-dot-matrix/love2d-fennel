(local Rectangle {})
(set Rectangle.__index Rectangle)
(local Physics2D (require "src.__2Dphysics"))
(local Space2D (require "src.__2Dspace"))

(fn Rectangle.new [self]
  (local f_random love.math.random)
  (local rectangle (setmetatable {} self))
  (let [initialX (+ (* (f_random) 200) 50)
  initialY (+ (* (f_random) 200) 50)
  initialDirection (* (f_random) (/ 2 math.pi))
  initialSpeed 300]
  (set rectangle.space (Space2D:new initialX initialY initialDirection initialSpeed)))
  (set rectangle.inBounds true)
  (set rectangle.behavior "bounce")
  rectangle)

(fn Rectangle.behavior [self mode]
  (set self.behavior mode))

;; Keyboard inputs
(fn Rectangle.keyboard [self mode]
  (when (= mode "w")
    self.y ))

(fn Rectangle.update [self dt]
  ;;(when (= self.behavior "elastic")
  ;;  (if (or (> self.x 600) (< self.x 0))
  ;;    (when (= true self.inBounds)
  ;;      (self:elasticCollision (/ pi 2))
  ;;      (set self.inBounds false))
  ;;    (when (= false self.inBounds)
  ;;      (set self.inBounds true)))
  ;;  (Physics2D.move self dt)))
  ;;(when (= self.behavior "controlled")
     ;;keyboard control
    ;;)

  )

(fn Rectangle.draw [self]
  (let [space self.space]
  (love.graphics.rectangle "line" space.x space.y 200 150)))

Rectangle
