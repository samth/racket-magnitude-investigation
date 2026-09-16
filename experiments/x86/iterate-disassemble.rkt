#lang racket/base
(require disassemble
         (prefix-in i: "inexact-capture.rkt")
         (prefix-in z: "typed-zfl-capture.rkt")
         (prefix-in a: "typed-zfl-alt-mag-capture.rkt"))
(for ([name (list 'inexact 'typed-zfl 'typed-zfl-alt-mag)]
      [impl (list i:mandelbrot z:mandelbrot a:mandelbrot)]
      [getter (list i:get-captured-iterate z:get-captured-iterate a:get-captured-iterate)])
  (impl #:width 1 #:height 1 #:max_iter 1 #:lut (make-bytes 8)
        #:corner -2+2i #:scale 4 #:dst (make-bytes 4)
        #:dst_offset 0 #:dst_row_stride 4)
  (define proc (getter))
  (printf "~a iterate: ~a arity ~a\n" name (object-name proc) (procedure-arity proc))
  (with-output-to-file (format "~a-iterate-asm.txt" name)
    (lambda () (disassemble proc)) #:exists 'replace))
