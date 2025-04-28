;;Shape
;;Super Object
(fn update [self dt]
 (set self.x (+ self.x (* self.speed dt))))

(fn inheritor [class x y]
 (set class.x x)
 (set class.y y)
 (set class.speed 100)
 (set class.update update))

inheritor