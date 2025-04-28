(var tick nil)
(var drawRectangle nil)
(fn love.load []
  (set tick (require "src.Tutorial.tick"))
  (set drawRectangle false)
  (tick.delay (fn [] (set drawRectangle true)) 2)
  )

(fn love.update [dt]
  (tick.update dt)
)
(fn love.draw []
  (if drawRectangle
    (love.graphics.rectangle "fill" 100 100 300 200))
  )

