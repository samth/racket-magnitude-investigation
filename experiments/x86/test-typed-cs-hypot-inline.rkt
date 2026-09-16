#lang typed/racket

(: cs-hypot (-> Flonum Flonum Flonum))
(define cs-hypot
  (#%foreign-inline
   (foreign-procedure __atomic "(cs)hypot" (double-float double-float) double-float)
   #:effect))

(displayln (cs-hypot 3.0 4.0))
