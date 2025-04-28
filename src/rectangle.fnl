(local Rectangle {})
(set Rectangle.__index Rectangle)
<<<<<<< Updated upstream
=======
(local Space2D (require "src.Space2D"))
(local Physics2D (require "src.Physics2D"))

;;include player controllable attribute? negates player control when false.
>>>>>>> Stashed changes
(fn Rectangle.new [self]
  (local rectangle (setmetatable {} self))
  (set rectangle.x (* (love.math.random) 200))
  (set rectangle.speed 300)
  (set rectangle.state true)
  rectangle)

(fn Rectangle.update [self dt]
  (if (or (> self.x 600) (< self.x 0))
    (when (= true self.state)
      (set self.speed (* -1 self.speed))
      (set self.state false))
    (when (= false self.state)
      (set self.state true)))
  (set self.x (+ self.x (* self.speed dt))))

(fn Rectangle.draw [self]
  (love.graphics.rectangle "line" self.x 50 200 150))

Rectangle
