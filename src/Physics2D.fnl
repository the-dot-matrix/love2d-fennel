(local pi math.pi)

;; requires Super Object to have a space2d instance as an attribute
(fn move [object dt]
  (set object.x (+ object.x (* (object:ux) object.speed dt)))
  (set object.y (+ object.y (* (object:uy) object.speed dt))))

(fn boundaryBounce [object]
  ;; x bounds
  (if (or (> object.x 600) (< object.x 0))
    (when (= true object.xBounds)
      (set object.polar (math.atan2 (object:uy) (- (object:ux))))
      (set object.xBounds false)))
  (if (and (<= object.x  400) (>= object.x 0))
    (when (= false object.xBounds)
      (set object.xBounds true)))
  ;; y bounds
  (if (or (> object.y 400) (< object.y 0))
    (when (= true object.yBounds)
      (set object.polar (math.atan2 (- (object:uy))  (object:ux)))
      (set object.yBounds false)))
  (if (and (<= object.y  450) (>= object.y 0))
    (when (= false object.yBounds) 
      (set object.yBounds true))))

;; work on complements 
;;;;;; WORK ON LATER
;; Boundary Object Class? based on length and position and orientation (equation based?) matrix
(fn elasticCollision [object wall]
  ;; wall is a radian from 0 to pi
  )

(fn Inheritor [object]
  (set object.move move)
  (set object.boundaryBounce boundaryBounce))

Inheritor