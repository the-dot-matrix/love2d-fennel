(local Space {})
(set Space.__index Space)

(local f_sin math.sin)
(local f_cos math.cos)

(fn Space.new [self initialX initialY initialDirection initialSpeed]
 (local space (setmetatable {} self))
 (set space.x nil)
 (set space.y nil)
 (set space.polar nil)
 (set space.speed nil)
 (set space.ux (f_sin nil)) ;; check bounding of trig functions
 (set space.uy (f_cos nil))
 space)

(fn Space.setPolar [self direction]
 (set self.polar direction)
 (set self.ux (f_sin self.polar))
 (set self.uy (f_cos self.polar))
 )