(local Rectangle (require "src.rectangle"))
(local rectangleA (Rectangle:new))
(local rectangleB (Rectangle:new))
(local rectangleC (Rectangle:new))
(local RectangleTable []) ;; sequential table for all possible rectangles

(fn love.load []
  (let [(w h) (love.graphics.getDimensions)]
    (love.window.updateMode w h {"vsync" false})
  )
  (rectangleA:load)
  (table.insert RectangleTable rectangleA)
  (rectangleB:load)
  (table.insert RectangleTable rectangleB)
  (rectangleC:load)
  (table.insert RectangleTable rectangleC)
  (print (fennel.view RectangleTable))
  )

(fn love.update [dt]
  (each [index value (ipairs RectangleTable)]
    (if (< value.x 600)
      (value:update dt)
      )
    )
  )

(fn love.draw []
  (each [index value (ipairs RectangleTable)]
    (value:draw)
    )
  (love.graphics.print (.. "fnl:\t" (love.timer.getFPS)))
  )
