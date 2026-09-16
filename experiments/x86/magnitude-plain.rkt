#lang racket/base
(require racket/unsafe/ops)

(provide run-native run-native-fl<=)

(define (run-native zs rounds)
  (define len (vector-length zs))
  (let outer ([round 0] [hits 0])
    (if (= round rounds)
        hits
        (let inner ([j 0] [hits hits])
          (if (= j len)
              (outer (add1 round) hits)
              (inner (add1 j)
                     (if (<= (magnitude (vector-ref zs j)) 2.0)
                         (add1 hits) hits)))))))

(define (run-native-fl<= zs rounds)
  (define len (vector-length zs))
  (let outer ([round 0] [hits 0])
    (if (= round rounds)
        hits
        (let inner ([j 0] [hits hits])
          (if (= j len)
              (outer (add1 round) hits)
              (inner (add1 j)
                     (if (unsafe-fl<= (magnitude (vector-ref zs j)) 2.0)
                         (add1 hits) hits)))))))
