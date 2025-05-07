(local projectile (require :src.Tutorial.projectile))

(local Bullet {})
(set Bullet.__index Bullet)

(fn Bullet.new [self x y]
 (local bullet (setmetatable {} self))
 (set self.spawns [])
 (set self.miss false)
 bullet)

(fn Bullet.update [self dt]
 (local window_height (love.graphics.getHeight))
 (each [_ v (ipairs self.spawns)]
  (when (> v.y window_height)
   (set self.miss true))
  (set v.y (+ v.y (* v.speed dt))))) 

(fn Bullet.draw [self]
 (each [_ v (ipairs self.spawns)]
  (love.graphics.draw v.image v.x v.y)))

(fn Bullet.miss? [self]
 (local bulletMiss? self.miss)
 bulletMiss?)

(fn Bullet.keyPressed [self gun]
 (let [
  x (. gun :x)
  y (. gun :y)]
 (table.insert self.spawns (projectile:new x y))))

(fn Bullet.collisionCheck? [projectileHitbox enemyHitbox]
 (let [
  collide? (and
   (< (. projectileHitbox :left) (. enemyHitbox :right))
   (> (. projectileHitbox :right) (. enemyHitbox :left))
   (< (. projectileHitbox :top) (. enemyHitbox :bottom))
   (> (. projectileHitbox :bottom) (. enemyHitbox :top)))
  ]
  collide?))

(fn Bullet.collide? [self enemyHitbox]
 (var collide? false)
 (each [i v (ipairs self.spawns)]
  (when (self.collisionCheck? (v:hitbox) enemyHitbox)
   (table.remove self.spawns i)
   (set collide? true)))
 collide?)

Bullet