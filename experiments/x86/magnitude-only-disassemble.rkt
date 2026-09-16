#lang racket/base
(require disassemble "magnitude-plain.rkt" "magnitude-typed.rkt")
(for ([name '(native native-fl<= tr-default ratio-zero ratio-fl simple hybrid)]
      [proc (list run-native run-native-fl<= run-default run-ratio-zero run-ratio run-simple run-hybrid)])
  (with-output-to-file (format "~a-mag-asm.txt" name)
    (lambda () (disassemble proc)) #:exists 'replace))
