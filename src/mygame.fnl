; practicing how to love
(local lume (require :src.Tutorial.Packages.lume))

(var player {})
(var coin_pouch [])
(var screenShake 0)
(var shakeWait 0)
(var shakeOffset {:x 0 :y 0})
(fn love.load []
  (let [x     100
        y     100
        size  25
        speed 200
        score 0
        image (love.graphics.newImage :src/Tutorial/Pictures/face.png)
        ]
    (set player {: x : y : size : speed : score : image}))
  (if (love.filesystem.getInfo :savedata.txt)
    (do (local file (love.filesystem.read :savedata.txt))
        (local data (lume.deserialize file))
        (set player.x data.player.x)
        (set player.y data.player.y)
        (set player.size data.player.size)
        (set player.score data.player.score)
    (let [(w h) (love.graphics.getDimensions)]
        (for [i 1 (length data.coin_pouch)]
          (local coin_size 10)
          (let [ ghostCoin (. data.coin_pouch i)
                coin {:x ghostCoin.x
                      :y ghostCoin.y
                      :size coin_size
                      :image (love.graphics.newImage :src/Tutorial/Pictures/dollar.png)}]
            (table.insert coin_pouch coin)))))
  (do (let [(w h) (love.graphics.getDimensions)]
      (for [i 1 25]
        (local coin_size 10)
        (let [coin {:x (* (+ (- w (* 2 coin_size)) coin_size) (love.math.random)) 
                    :y (* (+ (- h (* 2 coin_size)) coin_size) (love.math.random))
                    :size coin_size
                    :image (love.graphics.newImage :src/Tutorial/Pictures/dollar.png)}]
          (table.insert coin_pouch coin)))))))
 
(fn love.update [dt]
  (when (> screenShake 0)
    (set screenShake (- screenShake dt))
    (if (> shakeWait 0)
      (set shakeWait (- shakeWait dt))
      (do (set shakeOffset.x (love.math.random -5 5))
            (set shakeOffset.y (love.math.random -5 5))
            (set shakeWait 0.05))
      ))
 (let [vx   (if (love.keyboard.isDown :left) -1 (love.keyboard.isDown :right) 1 0)
       vy   (if (love.keyboard.isDown :up) -1 (love.keyboard.isDown :down) 1 0)
       mag  (math.sqrt (+ (^ vx 2) (^ vy 2)))
       ux   (if (= mag 0) 0 (/ vx mag))
       uy   (if (= mag 0) 0 (/ vy mag))]
       (set player.x (+ player.x (* ux player.speed dt)))
       (set player.y (+ player.y (* uy player.speed dt))))
 (fn collision? [A B]
  (< (math.sqrt (+ (^ (- B.x A.x) 2) (^ (- B.y A.y) 2))) (+ A.size B.size)))
 (each [i v (ipairs coin_pouch)]
  (when (collision? player v) 
    (table.remove coin_pouch i)
    (set player.score (+ player.score 1))
    (set player.size (+ player.size 1))
    (set screenShake 0.2))))

(fn love.draw []
  (local (w h) (love.graphics.getDimensions))
  (love.graphics.push) ;; stores current display state (default)
    (when (> screenShake 0)
      (love.graphics.translate shakeOffset.x shakeOffset.y))
    (love.graphics.translate (- (/ w 2) player.x) (- (/ h 2) player.y))
    (each [_ v (ipairs coin_pouch)]
      (love.graphics.draw v.image v.x v.y 0
        1 1 (/ (v.image:getWidth) 2) (/ (v.image:getHeight) 2))
      (love.graphics.circle :line v.x v.y v.size))
    (love.graphics.circle :line player.x player.y player.size)
    (love.graphics.draw player.image player.x player.y 0
      1 1 (/ (player.image:getWidth) 2) (/ (player.image:getHeight) 2))
  (love.graphics.pop) ;; pulls previous display state (default)
  (love.graphics.print (..
    "score:\t" player.score)))

(fn saveGame []
  (var data {:player {} :coin_pouch {}})
  (set data.player {:x player.x :y player.y :size player.size :score player.score})
  (each [i v (ipairs coin_pouch)]
    (tset data.coin_pouch i {:x v.x :y v.y}))
  (local serialized (lume.serialize data))
  (love.filesystem.write :savedata.txt serialized))

(fn love.keypressed [key]
  (when (= key :f1)
    (saveGame))
  (when (= key :f2)
    (love.filesystem.remove :savedata.txt)
    (love.event.quit :restart)))