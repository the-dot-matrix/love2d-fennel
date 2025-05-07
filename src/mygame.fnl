; practicing how to love
(var circle nil)
(var angle nil)

(fn getDistance [x1 y1 x2 y2]
  (let [dx       (- x2 x1)
        dy       (- y2 y1)
        dx2      (* dx dx)
        dy2      (* dy dy)
        distance (math.sqrt (+ dx2 dy2))]
    distance))

(fn love.load []
  (let [x      100
        y      100
        radius 25
        speed  200]
    (set circle {: x : y : radius : speed})))

(fn love.update [dt]
  (let [(mouse_x mouse_y) (love.mouse.getPosition)
        distance          (getDistance circle.x circle.y mouse_x mouse_y)]
    (set angle (math.atan2 (- mouse_y circle.y) (- mouse_x circle.x)))
    (when ( < distance 300)
      (set circle.x (+ circle.x (* (math.cos angle) (/ distance 100)circle.speed dt)))
      (set circle.y (+ circle.y (* (math.sin angle) (/ distance 100) circle.speed dt))))))

(fn love.draw []
  (let [(mouse_x mouse_y) (love.mouse.getPosition)
        distance          (getDistance circle.x circle.y mouse_x mouse_y)]
    (love.graphics.print (.. 
        "angle:\t"      angle
        "\ndistance:\t" distance)
      10 10)
    (love.graphics.circle :line circle.x circle.y circle.radius)
    (love.graphics.circle :line circle.x circle.y distance)
    (love.graphics.line circle.x circle.y mouse_x  circle.y)
    (love.graphics.line mouse_x  mouse_y  mouse_x circle.y)
    (love.graphics.line circle.x circle.y mouse_x  mouse_y)))

(fn love.keypressed [key])
  