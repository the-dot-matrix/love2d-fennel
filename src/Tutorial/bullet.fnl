(local Bullet {})
(set Bullet.__index Bullet)

(fn Bullet.new [self x y]
 (local bullet (setmetatable {} self))
 (set self.spawns [])
 (set self.miss false)

 bullet
)

(fn Bullet.update [self dt]
 (local window_height (love.graphics.getHeight))
 (each [_ v (ipairs self.spawns)]
  (when (> v.y window_height)
   (set self.miss true))
  (set v.y (+ v.y (* v.speed dt)))
  )
 ) 

(fn Bullet.miss? [self]
 (local bulletMiss? self.miss)
 bulletMiss?
 )

(fn Bullet.draw [self]
 (each [_ v (ipairs self.spawns)]
  (love.graphics.draw v.image v.x v.y)
  ))

(fn Bullet.spawn [self x y]
 (print "shoot")
 (local projectile {})
 (set projectile.__index projectile)
 
 (set projectile.image (love.graphics.newImage :src/Tutorial/Pictures/bullet.png))
 (set projectile.x x)
 (set projectile.y y)
 (set projectile.speed 700)
 (set projectile.width (projectile.image:getWidth))
 (set projectile.height (projectile.image:getHeight))
 projectile)

(fn Bullet.keyPressed [self x y]
 (table.insert self.spawns (Bullet:spawn x y)))

Bullet