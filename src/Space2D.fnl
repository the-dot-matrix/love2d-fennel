(fn uxCalculator [self]
  (math.cos self.polar))

(fn uyCalculator [self]
  (math.sin self.polar))

(fn Inheritor [object xInit yInit speedInit direction]
  (set object.x xInit)
  (set object.y yInit)
  (set object.speed speedInit)
  (set object.polar direction)
  (set object.ux uxCalculator)
  (set object.uy uyCalculator))

Inheritor
