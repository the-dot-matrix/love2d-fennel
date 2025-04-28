(local shape (require "src.Tutorial.shape"))
(local Rectangle {})

(fn Rectangle.new [self x y width height]
 (shape self x y)
 (set self.width width)
 (set self.height height)
 self)

(fn Rectangle.draw [self]
 (love.graphics.rectangle "line" self.x self.y self.width self.height))

Rectangle
