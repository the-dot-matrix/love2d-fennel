(local Enemy {})
(set Enemy.__index Enemy)

(fn Enemy.new [self]
 (local enemy (setmetatable {} self))
 (set self.image (love.graphics.newImage :src/Tutorial/Pictures/snake.png))
 (set self.x 325)
 (set self.y 450)
 (set self.speed 100)
 (set self.width (self.image:getWidth))
 (set self.height (self.image:getHeight))
 (set self.direction 1)
 enemy)

(fn Enemy.hitbox [self]
 (let [hitbox {
  :right (+ self.x self.width)
  :left (+ self.x 0)
  :top (+ self.y 0)
  :bottom (+ self.y self.height)
  }]
  hitbox))

(fn Enemy.gotHit [self collide?]
 (when collide?
  (set self.speed (+ self.speed 100))))

(fn Enemy.update [self dt collide?]
 (self:gotHit collide?)
 (set self.x (+ self.x (* self.speed self.direction dt)))
 (local window_width (love.graphics.getWidth))
 (if (or (< self.x 0) (> (+ self.x self.width) window_width))
  (set self.direction (* self.direction -1))))

(fn Enemy.draw [self]
 (love.graphics.draw self.image self.x self.y))

Enemy