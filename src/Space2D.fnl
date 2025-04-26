(local Space2D {})
(set Space2D.__index Space2D)

(fn Space2D.new [self xInit yInit speedInit direction]
  (local space (setmetatable {} self))
  (set space.x xInit)
  (set space.y yInit)
  (set space.speed speedInit)
  (set space.polar direction)
  space)

(fn Space2D.ux [self]
  (math.cos self.polar))

(fn Space2D.uy [self]
  (math.sin self.polar))

Space2D
