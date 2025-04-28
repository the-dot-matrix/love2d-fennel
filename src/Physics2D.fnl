(local Physics2D {})
(set Physics2D.__index Physics2D)
;;(local Space2D (require "src.__2Dspace"))
(local pi math.pi)

;; requires Super Object to have a space2d instance as an attribute
(fn Physics2D.move [object dt]
  (local palkia object.space)
  (set palkia.x (+ palkia.x (* (palkia:ux) palkia.speed dt)))
  (set palkia.y (+ palkia.y (* (palkia:uy) palkia.speed dt))))

(fn Physics2D.boundaryBounce [object]
  ;; x bounds
  (local palkia object.space)
  (if (or (> palkia.x 600) (< palkia.x 0))
    (when (= true object.xBounds)
      (set palkia.polar (math.atan2 (palkia:uy) (- (palkia:ux))))
      (set object.xBounds false)))
  (if (and (<= palkia.x  400) (>= palkia.x 0))
    (when (= false object.xBounds)
      (set object.xBounds true)))
  ;; y bounds
  (if (or (> palkia.y 400) (< palkia.y 0))
    (when (= true object.yBounds)
      (set palkia.polar (math.atan2 (- (palkia:uy))  (palkia:ux)))
      (set object.yBounds false)))
  (if (and (<= palkia.y  450) (>= palkia.y 0))
    (when (= false object.yBounds) 
      (set object.yBounds true))))

;; work on complements 
;;;;;; WORK ON LATER
;; Boundary Object Class? based on length and position and orientation (equation based?) matrix
(fn Physics2D.elasticCollision [object wall]
  (local palkia object.space)
  ;; wall is a radian from 0 to pi
  )

Physics2D