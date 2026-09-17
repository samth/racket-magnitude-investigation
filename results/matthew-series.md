# Matthew Flatt's Racket CS numeric changes and the Typed Racket zero test

The main improvement comes from Matthew Flatt's `e6b47bd2ce`, which connects Racket CS `real->double-flonum` directly to Chez's existing `real->flonum` primitive optimization. With unmodified Typed Racket, it removes two 16-byte flonum boxes per hot Mandelbrot iteration. The later complex-primitive commit primarily improves the explicitly typed complex-constant variant. Specializing the remaining generated `zero?` removes one additional 16-byte box per magnitude call and matters much more on ARM than x86.

| Change | x86 `typed-zfl` | ARM `typed-zfl` | Allocation effect |
|---|---:|---:|---:|
| Matthew's `real->double-flonum` commit, versus its parent | 863 -> 503 ms (-41.7%) | 4318 -> 2369 ms (-45.1%) | -3337 MB, approximately two boxes per hot iteration |
| Matthew's later complex primitives, `typed-zfl-cfl` only | 646 -> 515 ms (-20.3%) | 3235 -> 2539 ms (-21.5%) | Reaches the same 5166 MB as `typed-zfl` |
| `zero?` -> `unsafe-fl=`, on current HEAD | 498 -> 450 ms (-9.6%) | 2385 -> 1683 ms (-29.4%) | -1681 MB, approximately one box per hot magnitude call |
| Parent -> current HEAD plus specialized zero test | 863 -> 450 ms (-47.9%) | 4318 -> 1683 ms (-61.0%) | 8503/8537 -> 3485 MB |

## Revisions and method

- `6552499e20`: parent of Matthew's numeric changes and the comparison baseline.
- `e6b47bd2ce`: Matthew's `CS: improve inlining of real->double-flonum` commit only.
- `bf51bad18f`: the preceding commit plus Matthew's `make-flrectangular`, `flreal-part`, and `flimag-part` improvements.
- `789ef10c51`: current Racket/Chez HEAD for this run, including Matthew's semantic repair for `flreal-part` and `flimag-part` on flonum arguments.
- Typed Racket is unchanged at `c01299b5` in the first four columns. The final column changes only commit `8c8af219`, `(zero? i)` to `(unsafe-fl= i 0.0)` in `float-complex.rkt`.
- Each program uses a 1024x1024 image and `max_iter=1024`, with one discarded warmup and five timed runs pinned to CPU 0. The harness compares every output byte with the untyped reference.
- The Racket commit range has no changes under `racket/collects`; the same collection/package installation was held constant within each architecture. Compiled roots were separate, and every benchmark module was regenerated for each configuration.

The cells below are `average milliseconds / allocated MB`. The full machine-readable data, including minima and maxima, is in `matthew-series.csv`.

### X86

Times are milliseconds; allocation is MB.

| Variant | before | `e6b47` | `bf51` | HEAD | HEAD + `unsafe-fl=` |
|---|---:|---:|---:|---:|---:|
| `inexact` | 1329 / 8549 | 1331 / 8549 | 1335 / 8549 | 1329 / 8549 | 1328 / 8549 |
| `typed` | 1327 / 8583 | 1328 / 8583 | 1338 / 8583 | 1327 / 8583 | 1326 / 8583 |
| `typed-zfl` | 863 / 8503 | 503 / 5166 | 499 / 5166 | 498 / 5166 | 450 / 3485 |
| `typed-zfl-cfl` | 994 / 8537 | 646 / 5200 | 515 / 5166 | 511 / 5166 | 447 / 3485 |
| `typed-zfl-alt-mag` | 647 / 6822 | 451 / 3485 | 451 / 3485 | 451 / 3485 | 452 / 3485 |
| `typed-scalar` | 482 / 3502 | 479 / 3468 | 476 / 3468 | 476 / 3468 | 476 / 3468 |
| `typed-scalar-simpl` | 437 / 3502 | 431 / 3468 | 430 / 3468 | 428 / 3468 | 432 / 3468 |
| `typed-opt` | 287 / 51 | 288 / 51 | 288 / 51 | 287 / 51 | 287 / 51 |
| `roofline` | 280 / 1 | 280 / 1 | 279 / 1 | 280 / 1 | 280 / 1 |
| `typed-zfl-squared-mag` | 650 / 6822 | 418 / 3485 | 416 / 3485 | 418 / 3485 | 417 / 3485 |
| `typed-scalar-cached` | 414 / 3502 | 408 / 3468 | 408 / 3468 | 410 / 3468 | 407 / 3468 |
| `typed-scalar-named-let` | 333 / 119 | 326 / 85 | 336 / 85 | 326 / 85 | 326 / 85 |
| `typed-opt-generic` | 291 / 51 | 291 / 51 | 290 / 51 | 291 / 51 | 291 / 51 |
| `typed-opt-cross-add` | 278 / 51 | 279 / 51 | 278 / 51 | 278 / 51 | 277 / 51 |
| `typed-opt-cross-add-four` | 282 / 51 | 282 / 51 | 282 / 51 | 282 / 51 | 282 / 51 |
| `typed-opt-cross-add-unsafe-i` | 285 / 51 | 286 / 51 | 284 / 51 | 284 / 51 | 284 / 51 |
| `typed-opt-cross-add-unsafe` | 283 / 35 | 285 / 35 | 283 / 35 | 283 / 35 | 283 / 35 |

### ARM

Times are milliseconds; allocation is MB.

| Variant | before | `e6b47` | `bf51` | HEAD | HEAD + `unsafe-fl=` |
|---|---:|---:|---:|---:|---:|
| `inexact` | 3860 / 8583 | 3599 / 8583 | 3599 / 8549 | 3886 / 8549 | 3887 / 8549 |
| `typed` | 3583 / 8616 | 3587 / 8616 | 3837 / 8583 | 3590 / 8583 | 3578 / 8583 |
| `typed-zfl` | 4318 / 8537 | 2369 / 5200 | 2384 / 5166 | 2385 / 5166 | 1683 / 3485 |
| `typed-zfl-cfl` | 5034 / 8571 | 3235 / 5233 | 2539 / 5166 | 2580 / 5166 | 1709 / 3485 |
| `typed-zfl-alt-mag` | 3105 / 6855 | 1026 / 3518 | 1027 / 3485 | 1019 / 3485 | 1025 / 3485 |
| `typed-scalar` | 1836 / 3502 | 1829 / 3468 | 1821 / 3468 | 1829 / 3468 | 1824 / 3468 |
| `typed-scalar-simpl` | 924 / 3502 | 904 / 3468 | 903 / 3468 | 909 / 3468 | 909 / 3468 |
| `typed-opt` | 456 / 51 | 453 / 51 | 452 / 51 | 449 / 51 | 450 / 51 |
| `roofline` | 324 / 1 | 323 / 1 | 327 / 1 | 323 / 1 | 326 / 1 |
| `typed-zfl-squared-mag` | 2657 / 6855 | 865 / 3518 | 856 / 3485 | 862 / 3485 | 864 / 3485 |
| `typed-scalar-cached` | 867 / 3502 | 855 / 3468 | 857 / 3468 | 861 / 3468 | 861 / 3468 |
| `typed-scalar-named-let` | 569 / 119 | 551 / 85 | 548 / 85 | 551 / 85 | 552 / 85 |
| `typed-opt-generic` | 481 / 51 | 483 / 51 | 480 / 51 | 484 / 51 | 481 / 51 |
| `typed-opt-cross-add` | 410 / 51 | 412 / 51 | 413 / 51 | 410 / 51 | 409 / 51 |
| `typed-opt-cross-add-four` | 420 / 51 | 416 / 51 | 417 / 51 | 422 / 51 | 417 / 51 |
| `typed-opt-cross-add-unsafe-i` | 344 / 51 | 341 / 51 | 340 / 51 | 337 / 51 | 344 / 51 |
| `typed-opt-cross-add-unsafe` | 332 / 35 | 328 / 35 | 328 / 35 | 327 / 35 | 331 / 35 |

## What each change does

In `e6b47bd2ce`, Matthew changes the Racket CS implementation from a separately compiled wrapper containing a check and `exact->inexact` to a direct call to Chez's `#2%real->flonum`. He also changes error rewriting so failures still name `real->double-flonum`. That lets Chez's existing `known-flonum-result?` optimization see through the Racket operation. The 3337 MB reduction is 32.0 bytes for each of the 104,129,299 hot iterations, matching two 16-byte boxed flonums.

That first commit accounts for essentially all improvement in `typed-zfl`, `typed-zfl-alt-mag`, and `typed-zfl-squared-mag`. The scalar and explicitly optimized programs move little because they did not execute the two redundant coercions in the same hot path. Their small 34 MB allocation reduction reflects less frequent coercions outside that recurrence.

In `bf51bad18f`, Matthew routes `flreal-part`, `flimag-part`, and `make-flrectangular` directly through Chez primitives and marks `fl-make-rectangular` as taking unboxed arguments. This mostly helps `typed-zfl-cfl`, where the explicit `Float-Complex` binding made those operations visible in a less favorable form. Commit `789ef10c51` repairs the argument-error behavior for real flonum inputs; it has no material benchmark cost.

The zero-test change is independent and remains worthwhile after all of Matthew's changes. The generic `(zero? i)` in Typed Racket's generated magnitude formula still requires `i` as a boxed Racket value. `(unsafe-fl= i 0.0)` keeps it in the flonum path. The 1681 MB allocation reduction is about 16.1 bytes per hot iteration, matching one boxed flonum. Removing that one box improves `typed-zfl` by 9.6% on x86 and 29.4% on the Neoverse N1. The larger ARM effect agrees with the earlier disassembly result: boxed calls, tag checks, address materialization, and dependent memory traffic are substantially more expensive there.

`typed-zfl-alt-mag` and `typed-zfl-squared-mag` do not contain this generated magnitude zero test, so their results are unchanged by the one-line patch. The scalar, optimized, and roofline controls are also unchanged within ordinary run variation.

The ARM `inexact` baselines varied by about 8% between independently rebuilt configurations even though the low-allocation controls stayed within about 1-2%. Conclusions above therefore rely on the much larger time changes together with exact allocation differences; small timing differences between adjacent rows should be treated as noise. The x86 `e6b47` `typed-zfl-cfl` entry is a clean targeted rerun after one five-sample run contained a 1156 ms outlier.
