; practicing how to love
(var tilemap [])
(var image nil)
(var player nil)
(var width 0)
(var height 0)
(var image_width 0)
(var image_height 0)
(var quads [])

(fn love.load []
  (set image (love.graphics.newImage :src/Tutorial/Pictures/tileset.png))
  (set (image_width image_height) (image:getDimensions))
  (set width (- (/ image_width 3) 2))
  (set height (- (/ image_height 2) 2))
  (for [index 0 6]
    (local i (% index 3))
    (local j (math.floor (/ index 3)))
    (table.insert quads 
      (love.graphics.newQuad
        (+ 1 (* i (+ width 2)))
        (+ 1 (* j (+ height 2)))
        width height
        image_width image_height))
    )
  (set tilemap [[1 6 6 2 1 6 6 2]
                 [3 0 0 4 5 0 0 3]
                 [3 0 0 0 0 0 0 3]
                 [4 2 0 0 0 0 1 5]
                 [1 5 0 0 0 0 4 2]
                 [3 0 0 0 0 0 0 3]
                 [3 0 0 1 2 0 0 3]
                 [4 6 6 5 4 6 6 5]])
  (set player {
    :image (love.graphics.newImage :src/Tutorial/Pictures/player.png)
    :tile_x 2
    :tile_y 2
    }))
 
(fn love.update [dt]
 
  )

(fn love.draw []
  (local r [1 1 1 0 0])
  (local g [1 0 0 0 1])
  (local b [1 0 1 1 1])
  (each [i line (ipairs tilemap)]
    (each [j tile (ipairs line)]
        (if (not= tile 0)
        (love.graphics.draw image (. quads tile) (* j width) (* i height)))))
  (love.graphics.draw player.image (* player.tile_x width) (* player.tile_y height)))

(fn love.keypressed [key]
  (fn isEmpty [x y]
    (= (. tilemap x y) 0))
  (local input_decoder {
    :right #(set $1.tile_x (if (isEmpty (+ $1.tile_x 1) $1.tile_y) (+ $1.tile_x 1) $1.tile_x))
    :left  #(set $1.tile_x (if (isEmpty (- $1.tile_x 1) $1.tile_y) (- $1.tile_x 1) $1.tile_x))
    :up    #(set $1.tile_y (if (isEmpty $1.tile_x (- $1.tile_y 1)) (- $1.tile_y 1) $1.tile_y))
    :down  #(set $1.tile_y (if (isEmpty $1.tile_x (+ $1.tile_y 1)) (+ $1.tile_y 1) $1.tile_y))
    })
  ((. input_decoder key) player)
  )