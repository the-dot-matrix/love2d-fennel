;; change object from global to local, uncomment
 (global Object nil) ;; works because module can access via global
;(var Object nil) ;; fails because of local scope?? even though instantiated outside of scope
;; of function where it is called
(fn love.load []
  (set Object (require "src.Tutorial.Packages.classic"))
  (require "src.Tutorial.rectangle")
  (local r1 (_G.Rectangle))
  (local r2 (_G.Rectangle))
  (print r1.test r2.test)
  )