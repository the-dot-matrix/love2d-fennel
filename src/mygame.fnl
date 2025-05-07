; practicing how to love
(local frames [])
(var currentFrame 0)

(fn love.load []
  (for [i 1 5 ]
    (local path (.. :src/Tutorial/Pictures/jump/jump i :.png ))
    (table.insert frames (love.graphics.newImage path)))
  )

(fn love.update [dt]
  (set currentFrame (% (+ currentFrame dt) 5))
  )

(fn love.draw []
  (love.graphics.draw (. frames (math.floor (+ currentFrame 1))))
  )