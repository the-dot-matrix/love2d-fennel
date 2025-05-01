(local Rectangle {}) (set Rectangle.__index Rectangle)
(local Vector (require :src.vector))

(fn Rectangle.new [self x y w h s]
  (let [size      (Vector:new (or w 50) (or h 75))
        x         (or x (+ (* (love.math.random) 200) 50))
        y         (or y (+ (* (love.math.random) 200) 50))
        distance  (Vector:new x y)
        speed     (or s (+ (* (love.math.random) 400) 100))
        direction (* (love.math.random) 2 math.pi)
        velocity  (Vector:new speed direction true)
        mode      :line
        rectangle {: size : distance : velocity : mode }]
    (setmetatable rectangle self)))

(fn Rectangle.update [self dt collides]
  (set self.distance (+ self.distance (* self.velocity dt)))
  (if (> (length collides) 0)  
    (do (set self.velocity (self:bounces collides))
        (set self.mode :fill))
    (set self.mode :line)))

(fn Rectangle.draw [self collides]
  (let [(x y) (values self.distance.x self.distance.y)
        (w h) (values self.size.x self.size.y)]
    (love.graphics.rectangle self.mode x y w h)))

(fn Rectangle.collide? [self other]
  (let [left      #$1.distance.x
        right     #(+ $1.distance.x $1.size.x)
        top       #$1.distance.y
        bottom    #(+ $1.distance.y $1.size.y)
        maxleft   (math.max (left self) (left other))
        minright  (math.min (right self) (right other))
        maxtop    (math.max (top self) (top other))
        minbottom (math.min (bottom self) (bottom other))
        width     (- minright maxleft)
        height    (- minbottom maxtop)
        size      (Vector:new width height)
        distance  (Vector:new maxleft maxtop)
        collision {: size : distance}]
    (when (and (> width 0) (> height 0)) collision)))

(fn Rectangle.bounces [self collides]
  (let [flipx   (Vector:new -1 1)
        flipx   (flipx:polar)
        flipy   (Vector:new 1 -1)
        flipy   (flipy:polar)
        cwidth  (. collides 1 :size :x)
        cheight (. collides 1 :size :y)
        (a f)   (case [(length collides) cwidth cheight]
                  (where [1 w h] (> w h)) (values flipy 1)
                  (where [1 w h] (< w h)) (values flipx 1)
                  _ (values 0 0))
        sum     (accumulate [new a _ c (ipairs collides)]
                  (self:bounce c new))
        avg     (/ sum (+ (length collides) f))]
    (Vector:new (self.velocity:mag) avg true)))

(fn Rectangle.bounce [self collide accum]
  (let [center      #(+ $1.distance (/ $1.size 2))
        direction   (- (center self) (center collide))
        unitvector  (/ direction (direction:mag))
        pushangle   (unitvector:polar)]
    (+ accum pushangle)))

Rectangle
