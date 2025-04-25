(local Spawner {})
(set Spawner.__index Spawner)

(fn Spawner.new [self class]
  (local spawner (setmetatable {} self))
  (set spawner.class class)
  (set spawner.spawns [])
  spawner)

(fn Spawner.update [self dt]
  (each [_ spawn (ipairs self.spawns)]
    (spawn:update dt)))

(fn Spawner.draw [self]
  (each [_ spawn (ipairs self.spawns)]
    (spawn:draw)))

(fn Spawner.spawn [self ...]
  (table.insert self.spawns (self.class:new ...)))

Spawner
