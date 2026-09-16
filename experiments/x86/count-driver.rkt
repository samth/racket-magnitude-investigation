#lang racket/base
(require "inexact-count.rkt")
(mandelbrot #:width 1024 #:height 1024 #:max_iter 1024
            #:lut (make-bytes (* 4 1025)) #:corner -2+2i #:scale (/ 4 1024)
            #:dst (make-bytes (* 4 1024 1024))
            #:dst_offset 0 #:dst_row_stride (* 4 1024))
(printf "iteration count: ~a\n" iteration-count)
