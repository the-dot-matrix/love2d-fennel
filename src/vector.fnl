(local Vector {}) (set Vector.__index Vector)

(fn Vector.new [self a b polar?]
  (let [x (if polar? (* (math.cos b) a) a)
        y (if polar? (* (math.sin b) a) b)]
    (setmetatable {: x : y} self)))

(fn Vector.__add [a b]
  (case [(getmetatable a) (getmetatable b)]
    [Vector Vector] (Vector:new (+ a.x b.x) (+ a.y b.y))
    _ (error "cannot (+) vector and non-vector")))

(fn Vector.__mul [a b]
  (case [(type a) (getmetatable a) (type b) (getmetatable b)]
    [:number _ _ Vector]  (Vector:new (* a b.x) (* a b.y))
    [_ Vector :number _ ] (Vector:new (* a.x b) (* a.y b))
    [_ Vector _ Vector]   (Vector:new (* a.x b.x) (* a.y b.y))
    _ (error "cannot (*) vector by non-vector/scalar")))

Vector
