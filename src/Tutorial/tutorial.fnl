;; change object from global to local, uncomment 
; (local globalOrLocal true)
; ;;;;;;;;;;FALSE EVEN IF FIRST CONDITION DOES NOT EXECUTE PROGRAM ACTS LIKE GLOBAL EXISTS, REQUIRES
; ;;;; COMMENTS TO SHOW
; (when globalOrLocal (global Object nil) (print "global"));;change this to alternate between global and local
; (when (not globalOrLocal) (var Object nil) (print "local"));; works because module can access via global
; ;;;;;;;;;;;;Comment / un comment line 8 and line 9 to alternate between local and global objects
;;(var Object nil)
(global Object nil)
 ;; fails because of local scope?? even though instantiated outside of scope
;; of function where it is called
(global Shape nil)
(var Rectangle nil)
(var Circle nil)
(var r1 nil)
(var r2 nil)
(fn love.load []
  (set Object (require "src.Tutorial.Packages.classic"))
  ;;Can use (require "src.Tutorial.rectangle") but must make rectangle in said module global, and 
  ;;specify the calling of a global variable with _G.
  (set Shape (require "src.Tutorial.shape"))
  (set Rectangle (require "src.Tutorial.rectangle")) 
  (set Circle (require "src.Tutorial.circle"));; tutorial does not set a rectangle class object
  ;; due to differences in fennel/lua scoping of modules. fennel requires passing of class object in module and 
  ;;storing of said object as a variable.
  (set r1 (Rectangle 100 100 200 50)) ;; Classic package for new, if no object is returned in fn new of object,
  ;;calling the name of the function works, likely due to functionality from the classic package.
  ;;however, explicitly calling a the new function of the object, fails bc of nil value.
  (set r2 (Circle 350 80 40))
  )

(fn love.update [dt]
  (r1:update dt)
  (r2:update dt)
  )

(fn love.draw []
  (r1:draw)
  (r2:draw)
  )