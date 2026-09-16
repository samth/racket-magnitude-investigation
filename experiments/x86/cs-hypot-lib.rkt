#lang racket/base

(provide cs-hypot)

(define cs-hypot
  (#%foreign-inline
   (foreign-procedure __atomic "(cs)hypot" (double-float double-float) double-float)
   #:effect))
