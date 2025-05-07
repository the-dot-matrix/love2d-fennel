; practicing how to love
(var image nil)
(local frames [])
(var currentFrame 0)

(fn love.load []
  (set image (love.graphics.newImage :src/Tutorial/Pictures/jump_3.png))
  (local frame_width 117)
  (local frame_height 233)
  (local width (image:getWidth))
  (local height (image:getHeight))
  (for [index 0 4]
    (local j (math.floor (/ index 3)))
    (local i (% index 3))
    (table.insert frames
      (love.graphics.newQuad (+ 1 (* i (+ 2 frame_width))) (+ 1 (* j (+ 2 frame_height))) 
                              frame_width frame_height 
                              width height))))

(fn love.update [dt]
  (set currentFrame (% (+ currentFrame dt) 5))
  )

(fn love.draw []
  (love.graphics.draw image (. frames (math.floor (+ currentFrame 1))) 100 100)
  )