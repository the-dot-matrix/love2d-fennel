(local Object (require "src.Tutorial.Packages.classic"))
(local Shape (Object.extend Object))

(fn Shape.new [self x y]
 (set self.x x)
 (set self.y y)
 (set self.speed 100))

(fn Shape.update [self dt]
 (set self.x (+ self.x (* self.speed dt))))

Shape