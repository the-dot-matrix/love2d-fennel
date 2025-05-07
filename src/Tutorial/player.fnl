(local Player {})
(set Player.__index Player)
(fn Player.new [self]
  (local player (setmetatable {} self))
  (set self.image (love.graphics.newImage :src/Tutorial/Pictures/panda.png))
  (set self.x 300)
  (set self.y 20)
  (set self.speed 400)
  (set self.width (self.image:getWidth ))
  (set self.height (self.image:getHeight))
 player)

(fn Player.gun [self]
  (local coordinates {:x (+ self.x (/ self.width 2)) :y (+ self.y self.height)})
  coordinates)

(fn Player.update [self dt]
 (if (love.keyboard.isDown "left")
  (set self.x (- self.x (* self.speed dt)))
  (love.keyboard.isDown "right")
  (set self.x (+ self.x (* self.speed dt)))
  )
 (let [window_width (love.graphics.getWidth)]
  (if (< self.x 0)
    (set self.x 0)
   (> (+ self.x self.width) window_width)
    (set self.x (- window_width self.width)))))

(fn Player.draw [self]
 (love.graphics.draw self.image self.x self.y))

Player