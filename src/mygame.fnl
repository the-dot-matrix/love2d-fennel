; practicing how to love

(var song nil)
(var sfx nil)

(fn love.load []
  (set song (love.audio.newSource :src/Tutorial/Audio/song.ogg :stream))
  (set sfx (love.audio.newSource :src/Tutorial/Audio/sfx.ogg :static))
  ; (song:setLooping true)
  ; (song:play) ; identical methods


 )
 
(fn love.update [dt]
 
  )

(fn love.draw []
  )

(fn love.keypressed [key]
  (if (= key :space) (sfx:play))
  )