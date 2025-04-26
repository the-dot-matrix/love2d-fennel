(local Physics2D {})
(set Physics2D.__index Physics2D)
;;(local Space2D (require "src.__2Dspace"))
(local pi math.pi)

(fn Physics2D.move [object dt]
  (local palkia object.space)
  (set palkia.x (+ palkia.x (* (palkia:ux) palkia.speed dt)))
  (set palkia.y (+ palkia.y (* (palkia:uy) palkia.speed dt))))


;; work on complements 
;; Boundary Object Class? based on length and position and orientation (equation based?) matrix
(fn Physics2D.elasticCollision [object wall]
  ;; wall is a radian from 0 to pi
  (set object.direction (- wall object.direction)))

Physics2D