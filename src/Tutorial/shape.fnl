(global Shape (Object.extend Object)) ;; preferring explicit self passing

(fn Shape.new [self x y] 
 (set self.x x)
 (set self.y y)
 (set self.speed 100))

(fn Shape.update [self dt]
 (set self.x (+ self.x (* self.speed dt))))

Shape