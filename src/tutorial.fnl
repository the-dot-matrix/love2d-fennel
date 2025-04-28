
(var x nil)
(var y nil)
(var speed nil)
(var fruits [])

(fn love.load []
  (set fruits ["apple" "banana"])
  (table.insert fruits "pear")
  (table.insert fruits "pineapple")
  (table.remove fruits 1)
  (set (. fruits 1) "tomato")
  )

(fn love.update [dt]
)

(fn love.draw []
  (for [index 1 (length fruits)]
  (love.graphics.print (.. "yummy " (. fruits index)) 100 (+ 75 (* 25 index)))))
  (each [index value (ipairs fruits)]
    (love.graphics.print (.. "yummy " value) 100 (+ 75 (* 25 index)))
  )