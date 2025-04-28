(var x nil)
(var y nil)

(fn love.load []
 (set x 30)
 (set y 50)
  )

(fn love.update [dt]
  
)

(fn love.draw []
  (love.graphics.rectangle "line" x y 100 100)
  )

(fn love.keypressed [key]
  (when (= key "space")
    (set x (math.random 100 500))
    (set y (math.random 100 500)))
  )
 

