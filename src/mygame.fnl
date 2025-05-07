; practicing how to love
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
  (bullet:update dt)
  (local collide? (bullet:collide? (enemy:hitbox)))
  (enemy:update dt collide?)
  (when (bullet:miss?)
    (love.load)))

(fn love.draw []
  (player:draw)
  (enemy:draw)
  (bullet:draw)
  (love.graphics.print (.. "fnl:\t" (love.timer.getFPS))))

(fn love.keypressed [key]
  (when (= key "space")
    (bullet:keyPressed (player:gun))))