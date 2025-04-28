(global Circle (Shape:extend))

(fn Circle.new [self x y radius]
 (Circle.super.new self x y)
 (set self.radius radius))

(fn Circle.draw [self]
 (love.graphics.circle "line" self.x self.y self.radius))

Circle
