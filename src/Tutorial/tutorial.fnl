(var r1 nil)
(var r2 nil)

(fn love.load []
  (local Rectangle (require "src.Tutorial.rectangle"))
  (local Circle (require "src.Tutorial.circle"))
  (set r1 (Rectangle:new 100 100 200 50))
  (set r2 (Circle:new 350 80 40))
)

(fn love.update [dt]
  (r1:update dt)
  (r2:update dt)
  )

(fn love.draw []
  (r1:draw)
  (r2:draw))