(local shape (require "src.Tutorial.shape"))
(local Circle {})

(fn Circle.new [self x y radius]
 (shape self x y)
 (set self.radius radius)
 self
 )

(fn Circle.draw [self]
 (love.graphics.circle "line" self.x self.y self.radius))

Circle