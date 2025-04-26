(local Physics2D {})
(set Physics2D.__index Physics2D)
;;(local Space2D (require "src.__2Dspace"))
(local pi math.pi)

(fn Physics2D.move [object dt]
  ;; Local
  (local space object.space)
  (local x space.x)
  (local y space.y)
  (local direction space.direction)
  (local ux space.ux)
  (local uy space.uy)
  (local speed object.speed)
  ;; Functions
  ;; unit vector x and y
  (local dx (* speed ux dt))
  (local dy (* speed uy dt)) ;; change in x and y as a function of dt
  ;; Operations / Assignment
  (set object.x (+ x dx))
  (set object.y (+ y dy)))

(fn Physics2D.elasticCollision [object wall]
  ;; wall is a radian from 0 to pi
  (set object.direction (- wall object.direction)))

Physics2D