(var listOfRectangles [])

(fn listOfRectangles.createRect []
  (var rect {})
  (set rect.x 100)
  (set rect.y 100)
  (set rect.width 70)
  (set rect.height 90)
  (set rect.speed 100)
  (table.insert listOfRectangles rect)
  )
  
(fn love.load []
  
  )

(fn love.update [dt]
  (each [index value (ipairs listOfRectangles)]
    (set value.x (+ value.x (* (. value "speed") dt))))
)

(fn love.draw []
  (each [index value (ipairs listOfRectangles)]
    (love.graphics.rectangle "line" (. value "x") (. value "y") (. value "width") (. value "height")))
  
  )

(fn love.keypressed [key]
  (when (= key "space") 
    (listOfRectangles:createRect))
  )