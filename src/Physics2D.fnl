(local physics2D {})

(local pi math.pi)

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
; TODO was in Rectangle.fnl, moving it with other colider WIP
; (when (and self.collide object.collide) 
;         (set self.polar (math.atan2 (- (self:uy)) (- (self:ux))))
;         (set object.polar (math.atan2 (- (object:uy)) (- (object:ux))))
;         (set self.collide false)
;         (set object.collide false))
;       (when false
;         (set self.collide true)
;         (set object.collide true))

physics2D