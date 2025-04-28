(var Object nil)

(fn love.load []
 (set Object (require "src.Tutorial.classic"))
 (require "src.Tutorial.rectangle")
 (local r1 (Rectangle:new))
 (local r2 (Rectangle:new))
 (print r1.test r2.test)
  )

(fn love.update [dt]
  
)

(fn love.draw []
 
  )


