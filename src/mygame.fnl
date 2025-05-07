; practicing how to love
(var arrow nil)
(var angle nil)

(fn getDistance [x1 y1 x2 y2]
  (let [dx       (- x2 x1)
        dy       (- y2 y1)
        dx2      (* dx dx)
        dy2      (* dy dy)
        distance (math.sqrt (+ dx2 dy2))]
    distance))

(fn love.load []
  (let [x               100
        y               100
        angle           0
        speed           200
        image           (love.graphics.newImage :src/Tutorial/Pictures/arrow_right.png)
        (width height)  (image:getDimensions)
        origin_x        (/ width 2)
        origin_y        (/ height 2)]
    (set arrow {: x : y : origin_x : origin_y : angle : speed : image})))

(fn love.update [dt]
  (let [(mouse_x mouse_y) (love.mouse.getPosition)
        distance          (getDistance arrow.x arrow.y mouse_x mouse_y)]
    (set angle (math.atan2 (- mouse_y arrow.y) (- mouse_x arrow.x)))
    (set arrow.angle angle)
    (when ( < distance 300)
      (set arrow.x (+ arrow.x (* (math.cos angle) (/ distance 100)arrow.speed dt)))
      (set arrow.y (+ arrow.y (* (math.sin angle) (/ distance 100) arrow.speed dt))))))

(fn love.draw []
  (let [(mouse_x mouse_y) (love.mouse.getPosition)
        distance          (getDistance arrow.x arrow.y mouse_x mouse_y)]
    (love.graphics.print (.. 
        "angle:\t"      angle
        "\ndistance:\t" distance)
      10 10)
    (love.graphics.draw arrow.image arrow.x arrow.y arrow.angle 
                        1 1 arrow.origin_x arrow.origin_y)
    (love.graphics.circle :fill mouse_x mouse_y 5)))