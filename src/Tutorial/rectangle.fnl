(local Shape (require "src.Tutorial.shape"))
(local Rectangle (Shape.extend Shape))

(fn Rectangle.new [self x y width height]
 (Rectangle.super.new self x y)
 (set self.width width)
 (set self.height height)
)

(fn Rectangle.draw [self]
 (love.graphics.rectangle "line" self.x self.y self.width self.height))

Rectangle
