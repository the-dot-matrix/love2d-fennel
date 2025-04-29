(local Rectangle {}) (set Rectangle.__index Rectangle)
(local Vector (require :src.vector))

(fn Rectangle.new [self]
  (let [size      (Vector:new 50 75)
        x         (+ (* (love.math.random) 200) 50)
        y         (+ (* (love.math.random) 200) 50)
        distance  (Vector:new x y)
        speed     (+ (* (love.math.random) 400) 100)
        direction (* (love.math.random) 2 math.pi)
        velocity  (Vector:new speed direction true)
        mode      :line
        rectangle {: size : distance : velocity : mode }]
    (setmetatable rectangle self)))

(fn Rectangle.update [self dt colliders]
  (let [(w h) (love.graphics.getDimensions)
        left  (< self.distance.x 0)
        right (> (+ self.distance.x self.size.x) w)
        above (< self.distance.y 0)
        below (> (+ self.distance.y self.size.y) h)
        flipx (* self.velocity (Vector:new -1 1))
        flipy (* self.velocity (Vector:new 1 -1))]
    (set self.distance (+ self.distance (* self.velocity dt)))
    (when left (set self.distance.x 0))
    (when right (set self.distance.x (- w self.size.x)))
    (when above (set self.distance.y 0))
    (when below (set self.distance.y (- h self.size.y)))
    (when (or left right) (set self.velocity flipx))
    (when (or above below) (set self.velocity flipy)))
    (if (> (length colliders) 0) 
        (set self.mode :fill)
        (set self.mode :line)))
  
(fn Rectangle.draw [self]
  (let [(x y) (values self.distance.x self.distance.y)
        (w h) (values self.size.x self.size.y)]
    (love.graphics.rectangle self.mode x y w h)))

(fn Rectangle.collide? [self other]
  (let [left    #$1.distance.x
        right   #(+ $1.distance.x $1.size.x)
        top     #$1.distance.y
        bottom  #(+ $1.distance.y $1.size.y)
        overlapright  (> (right self)   (left other))
        overlapleft   (< (left self)    (right other))
        overlaptop    (< (top self)     (bottom other))
        overlapbottom (> (bottom self)  (top other))]
    (and overlapleft overlapright overlaptop overlapbottom)))

Rectangle
