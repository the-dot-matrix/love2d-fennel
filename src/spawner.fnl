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

(fn multiObjectOverlapHandler [spawner]
  (local spawnLength (length spawner.spawns))
  (local spawns spawner.spawns)
  (local overlap [])
  ;;instantiates 2d array corresponding to overlap conditions.
  (for [index 1 spawnLength]
    (local falseLine [])
    (for [index 1 spawnLength]
      (table.insert falseLine index false)
      )
    (table.insert overlap index falseLine))
  (for [indexA 1 (- spawnLength 1)]
    (local rectangleA (. spawns indexA))
    (for [indexB (+ indexA 1) spawnLength]
      (local rectangleB (. spawns indexB))
      (if (rectangleA:overlapDetector rectangleB)
        (do (set overlap.indexA.indexB true)
                (set overlap.indexB.indexA true))
        )))
  overlap)

(fn multiObjectCollisionManager [spawner ])




(fn Spawner.collisionLogic [self]
  )
    

Spawner
