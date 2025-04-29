(local physics2D {})
(set physics2D.__index physics2D)

(local pi math.pi)

;; requires Super Object to have a space2d instance as an attribute
(fn physics2D.move [object dt]
  (set object.x (+ object.x (* (object:ux) object.speed dt)))
  (set object.y (+ object.y (* (object:uy) object.speed dt))))

(fn physics2D.boundaryBounce [object]
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

(fn physics2D.classInheritor [object]
  (set object.move physics2D.move)
  (set object.boundaryBounce physics2D.boundaryBounce))


(fn physics2D.basicObjectCollision [object spawner overlap]
  (local spawns spawner.spawns)
  (local collisionMangement [])
  (local overlapLength (length overlap))
  (for [index 1 overlapLength]
    (local spawn spawns.index)
    (var directionVector spawn.polar)
    (local overlapCenterVectors {}))
    )

physics2D