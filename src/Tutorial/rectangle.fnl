(global Rectangle (Shape:extend)) ;; colon useable here because Object.extend is not defined here
;; honestly, may start preferring to explicit self declarations.
;; fn FunctionName:attribute fails in Fennel, function declaration seems to require explicit self
;; declarations. 
(fn Rectangle.new [self x y  width height]
 (Rectangle.super.new self x y)
 (set self.width width)
 (set self.height height)
 ;; would need to return self, but something to do w/ package classic implementation of object? or 
 ;; I'm missing something when it comes to lua/fennel class instantiation.
 )

(fn Rectangle.update [self dt]
 (set self.x (+ self.x (* self.speed dt))))

(fn Rectangle.draw [self]
 (love.graphics.rectangle "line" self.x self.y self.width self.height))

;; tutorial excludes explicit Rectangle call, due to lua implicit passing/execution of code. 
Rectangle