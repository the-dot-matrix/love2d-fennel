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

(fn physics2D.classInheritor [class]
  (set class.move physics2D.move)
  (set class.boundaryBounce physics2D.boundaryBounce))


(fn physics2D.basicObjectCollision [object spawner overlap]
  (local spawns spawner.spawns)
  (local collisionMangement [])
  (local overlapLength (length overlap))
  (for [indexA 1 overlapLength]
    (local rectangleA spawns.indexA)
    (local spawnPolar rectangleA.polar)
    (var averagePolarAtoB 0) ;;stores polars from center A to center B for all rectangles B overlapping 
    (var polarHolderCounter 0)
    (local overlapLine overlap.indexA)
    (each [indexB isOverlap (pairs overlap)]
      (local rectangleB spawns.indexB)
      ;; if rectangle A and rectangle B overlap, store the vector between
      ;;the center of the rectangle A to rectangle B
      (if isOverlap
        (do (var xRelative 0)
          (var yRelative 0)
          (set xRelative (- (rectangleB:xCenter) (rectangleA:xCenter)))
          (set yRelative (- (rectangleB:yCenter) (rectangleA:yCenter)))
          (local unitVectorPairMagnitude (math.sqrt (+ (^ xRelative 2) (^ yRelative 2))))
          (set xRelative (/ xRelative unitVectorPairMagnitude))
          (set yRelative (/ yRelative unitVectorPairMagnitude))
          (set averagePolarAtoB (+ averagePolarAtoB (math.atan2 yRelative xRelative))))
        (set polarHolderCounter (+ polarHolderCounter 1))))
      ;;find average polar relation to all objects. polarity irrelevant
      ;; divides sum of all polars by number of polars, then modulo 2pi
      (set averagePolarAtoB (% (/ averagePolarAtoB polarHolderCounter) (* 2 math.pi)))
      ;;using find the projection of spawnPolar onto averagePolar, flip it and thats you're new
      ;;direction.
      )
    )

physics2D