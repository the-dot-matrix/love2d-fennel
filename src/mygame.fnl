;; practicing how to love
; (local Rectangle (require "src.rectangle"))
; (local Spawner (require "src.spawner"))
; (var rectangleSpawner nil)

; (fn love.load []
;   (let [(w h) (love.graphics.getDimensions)]
;     (love.window.updateMode w h {"vsync" false}))
;   (set rectangleSpawner (Spawner:new Rectangle)))

; (fn love.update [dt]
;   (rectangleSpawner:update dt))

; (fn love.draw []
;   (rectangleSpawner:draw)
;   (love.graphics.print (.. "fnl:\t" (love.timer.getFPS))))

; (fn love.keypressed [key]
;   (when (= key :space) (rectangleSpawner:spawn)))
;;;;;

    
  