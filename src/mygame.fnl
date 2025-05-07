; practicing how to love
(local Classic (require :src.Tutorial.Packages.classic))
(local player (require :src.Tutorial.player))
(local enemy (require :src.Tutorial.enemy))
(local bullet (require :src.Tutorial.bullet))
(fn love.load []
  (let [(w h) (love.graphics.getDimensions)]
    (love.window.updateMode w h {:vsync false}))
(player:new)
(enemy:new)
(bullet:new))

(fn love.update [dt]
  (player:update dt)
  (enemy:update dt)
  (bullet:update dt)
  (when (bullet:miss?)
    (love.load))
  )

(fn love.draw []
  (player:draw)
  (enemy:draw)
  (bullet:draw)
  (love.graphics.print (.. "fnl:\t" (love.timer.getFPS)))
)

(fn love.keypressed [key]
  (when (= key "space")
    (let [coordinates (player:gun)
      x (. coordinates :x)
      y (. coordinates :y)]
      (bullet:keyPressed x y))
    )
    )