;; (global key value) is equivalent to (set _G.key value), both access a special table dedicated to global key value pairs.

(global test 50)

(local test 99)

(fn some_function [test] 
 (when true 
  (local test 40)
  (print test))
 (print test))
(some_function 30)
(print test)

test
