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

(var Rectangle nil)
(var r1 nil)
(var r2 nil)
(fn love.load []
  (set Object (require "src.Tutorial.Packages.classic"))
  (set  Rectangle (require "src.Tutorial.rectangle" Object)) ;; tutorial does not set a rectangle class object
  ;; due to differences in fennel/lua scoping of modules. fennel requires passing of class object in module and 
  ;;storing of said object as a variable.
  (set r1 (Rectangle 100 100 200 50)) ;; Classic package for new, if no object is returned in fn new of object,
  ;;calling the name of the function works, likely due to functionality from the classic package.
  ;;however, explicitly calling a the new function of the object, fails bc of nil value.
  (set r2 (Rectangle 350 80 25 140))
  )

(fn love.update [dt]
  (r1:update dt)
  (r2:update dt)
  )

(fn love.draw []
  (r1:draw)
  (r2:draw)
  )