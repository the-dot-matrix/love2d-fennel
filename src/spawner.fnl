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
  (for [indexA 1 spawnLength]
    (local falseLine {})
    (table.insert overlap indexA falseLine))
  (for [indexA 1 (- spawnLength 1)]
    (local rectangleA (. spawns indexA))
    (for [indexB (+ indexA 1) spawnLength]
      (local rectangleB (. spawns indexB))
      (if (rectangleA:overlapDetector rectangleB)
        (do 
          (tset (. overlap indexA) indexB  true)
          (tset (. overlap indexB) indexA true))
        )))
  overlap)

(fn multiObjectCollisionManager [spawner ])

(fn Spawner.collisionLogic [self]
  (local overlap (multiObjectOverlapHandler self))
  (local spawns self.spawns)
  (for [indexA 1 (length overlap)] 
    (var rectangleAOverlapCheck false)
    (each [_ isOverlap (pairs (. overlap indexA))]
      (if isOverlap
        (set rectangleAOverlapCheck true)))
    (local rectangleA (. spawns indexA))
    (if rectangleAOverlapCheck
      (set rectangleA.mode "fill")
      (set rectangleA.mode "line")
      )
    )
  )
Spawner
