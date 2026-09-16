#lang racket/base
(require disassemble "typed-zfl-ratio-inf-capture.rkt")
(mandelbrot #:width 1 #:height 1 #:max_iter 1 #:lut (make-bytes 8)
            #:corner -2+2i #:scale 4 #:dst (make-bytes 4)
            #:dst_offset 0 #:dst_row_stride 4)
(with-output-to-file "typed-zfl-ratio-inf-iterate-asm.txt"
  (lambda () (disassemble (get-captured-iterate))) #:exists 'replace)
