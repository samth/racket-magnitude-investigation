#lang racket/base
(require ffi/unsafe)
(provide native-hypot)
(define native-hypot
  (get-ffi-obj "hypot" (ffi-lib "libm.so.6")
               (_fun _double _double -> _double)))
