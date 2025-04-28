
(var test 10)
(local hello (require "src.Tutorial.test"))
(print test)
(print (.. "from require " hello))

(print (.."global " _G.test))

; (fn love.load []
  
;   )

; (fn love.update [dt]
  
; )

; (fn love.draw []

;   )

