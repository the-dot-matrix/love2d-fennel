(local Projectile {})
(set Projectile.__index Projectile)

(fn Projectile.new [self x y]
 (local projectile (setmetatable {} self))
 (set self.image (love.graphics.newImage :src/Tutorial/Pictures/bullet.png))
 (set self.x x)
 (set self.y y)
 (set self.speed 700)
 (set self.width (self.image:getWidth))
 (set self.height (self.image:getHeight))
 projectile)

(fn Projectile.hitbox [self]
 (let [hitbox {
  :right (+ self.x self.width)
  :left (+ self.x 0)
  :top (+ self.y 0)
  :bottom (+ self.y self.height)
  }]
  hitbox))

Projectile 