(var myImage nil)
(var width nil)
(var height nil)

(fn love.load []
 (set myImage (love.graphics.newImage "src/Tutorial/Pictures/Carmeline_Picrew.png"))
 (set width (myImage:getWidth))
 (set height (myImage:getHeight))
 (love.graphics.setBackgroundColor 0.5 0.5 0.5)
)

(fn love.update [dt]
  
  )

(fn love.draw []
  ;; love.graphics.draw Image x y xscale yscale xorigin yorigin x shear y shear
  ;; same with love.graphics.print

  ;; commenting line 21 makes all images yellow. implies that setColor is not for all subsequent
  ;;operations but for subsequent operations w/ multiple calls. is universal? for single calls.
  
  (love.graphics.draw myImage 100 300 0 0.3 0.3 (/ width 2) (/ height 2))
  
  (love.graphics.setColor  1 0.8 0.2 0.5) 

  (love.graphics.draw myImage 300 300 0 0.3 0.3 (/ width 2) (/ height 2))
  
  (love.graphics.setColor  1 1 1 1)
  )