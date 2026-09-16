# Float-complex magnitude and Mandelbrot performance

All times are averages for a 1024x1024 Mandelbrot image with `max_iter=1024`, one discarded warmup, five measured runs, and CPU 0 affinity. Each result was checked byte-for-byte against the reference output. A relative time below 1 is faster than `inexact.rkt` on the same machine.

| Variant | Main change | x86 time / relative | ARM time / relative | Allocation, x86 / ARM |
|---|---|---:|---:|---:|
| `inexact.rkt` | Untyped complex arithmetic and runtime `magnitude` | 1333 ms / 1.000x | 3918 ms / 1.000x | 8549 / 8549 MB |
| `typed.rkt` | Typed Racket optimizer disabled | 1326 ms / 0.995x | 3941 ms / 1.006x | 8583 / 8583 MB |
| `typed-zfl.rkt` | Stock TR float-complex optimization: generic `zero?` and scaled division | 864 ms / 0.648x | 4138 ms / 1.056x | 8503 / 8503 MB |
| `typed-zfl-cfl.rkt` | Explicit `Float-Complex` binding for `c`; optimizer keeps it boxed | 996 ms / 0.747x | 5134 ms / 1.310x | 8537 / 8537 MB |
| zero-test fix [1] | `unsafe-fl=` plus the complete scaled-division formula | 786 ms / 0.589x | 4082 ms / 1.038x | 6822 / 6822 MB |
| ratio without infinity check [1] | Diagnostic shortened scaled-division formula | 768 ms / 0.575x | 3988 ms / 1.015x | 6822 / 6822 MB |
| `typed-zfl-alt-mag.rkt` | `sqrt(real^2 + imag^2)` | 644 ms / 0.483x | 3251 ms / 0.830x | 6822 / 6822 MB |
| `typed-zfl-squared-mag.rkt` | Compare `real^2 + imag^2` with 4; no `sqrt` | 655 ms / 0.491x | 2695 ms / 0.688x | 6822 / 6822 MB |
| coercion fix + stock magnitude | Remove redundant component coercions; retain stock zero test and scaled division | 504 ms / 0.378x | 2390 ms / 0.610x | 5166 / 5166 MB |
| Racket CS intrinsic + stock TR [2] | Inline `real->double-flonum` with a flonum identity fast path | 520 ms / 0.389x | 2347 ms / 0.606x | 5170 / 5170 MB |
| coercion fix + `typed-zfl-alt-mag.rkt` | Remove redundant component coercions with direct square root | 456 ms / 0.342x | 1048 ms / 0.267x | 3485 / 3485 MB |
| coercion fix + `typed-zfl-squared-mag.rkt` | Remove redundant component coercions with squared escape test | 424 ms / 0.318x | 889 ms / 0.227x | 3485 / 3485 MB |
| hybrid magnitude [1] | Direct square in the ordinary range, scaled division at extremes | 745 ms / 0.558x | 3483 ms / 0.886x | 6822 / 6822 MB |
| ordinary FFI libm `hypot` [1] | FFI wrapper with boxed arguments/result | 1306 ms / 0.978x | 4638 ms / 1.180x | 8523 / 8523 MB |
| new `unsafe-flhypot` primitive [1] | Compiler-known, unboxed libm `hypot` | 1338 ms / 1.002x | 3730 ms / 0.949x | 6822 / 6822 MB |
| atomic `#%foreign-inline` libm `hypot` [1] | Direct Chez foreign procedure | 762 ms / 0.571x | 16367 ms / 4.164x | 6822 / 13548 MB |
| `typed-scalar.rkt` | Carry real and imaginary components separately; scaled `flhypot` | 483 ms / 0.362x | 1836 ms / 0.469x | 3502 / 3502 MB |
| `typed-scalar-simpl.rkt` | Scalar components and squared escape test | 437 ms / 0.328x | 922 ms / 0.235x | 3502 / 3502 MB |
| `typed-scalar-cached.rkt` | Also reuse `zr^2` and `zi^2` in the recurrence | 415 ms / 0.311x | 870 ms / 0.222x | 3502 / 3502 MB |
| `typed-scalar-named-let.rkt` | Put the scalar recurrence in an immediately applied typed named loop | 334 ms / 0.251x | 570 ms / 0.145x | 119 / 119 MB |
| `typed-opt-generic.rkt` | Explicit row/column loops and hoisted scalar setup, generic integer types | 291 ms / 0.218x | 481 ms / 0.123x | 51 / 51 MB |
| `typed-opt.rkt` | Add fixnum argument and loop types | 288 ms / 0.216x | 453 ms / 0.116x | 51 / 51 MB |
| `typed-opt-cross-add.rkt` | Compute `2*zr*zi` as `p+p` | 278 ms / 0.209x | 410 ms / 0.105x | 51 / 51 MB |
| `typed-opt-cross-add-unsafe-i.rkt` | Also remove the checked `i+1` fixnum operation | 285 ms / 0.214x | 343 ms / 0.088x | 51 / 51 MB |
| `typed-opt-cross-add-unsafe.rkt` | Also use unsafe index conversion, fixnum arithmetic, and byte copy | 284 ms / 0.213x | 329 ms / 0.084x | 35 / 35 MB |
| `roofline.rkt` | Lucas's fully hand-specialized unsafe implementation | 279 ms / 0.209x | 324 ms / 0.083x | 1 / 1 MB |

[1] These rows came from the earlier normalized magnitude series, whose `inexact.rkt` baselines were 1335 ms on x86 and 3931 ms on ARM. The other rows came from the fresh Lucas/isolation series, whose baselines are shown in the first row. The baseline difference is below 1%. The ratio-without-infinity-check variant is diagnostic and does not preserve the full special-value behavior.

[2] This row uses unmodified Typed Racket at `c01299b5` with Racket branch `cs-intrinsic-real-to-double-flonum`. Its paired source-build baselines were 1337 ms on x86 and 3874 ms on ARM. The output was byte-identical to `inexact.rkt` on both machines.

The x86 host is an Intel Core Ultra 7 265. The ARM host `oracle` is a Neoverse N1. Both use Racket CS 9.3.0.8 snapshots. The iteration loop executes 104,129,299 times in this workload.

## Runtime and optimizer algorithms

Current Racket BC still implements complex magnitude with the scaled ratio formula. After taking absolute values and arranging `larger >= smaller`, it computes

```text
larger * sqrt(1 + (smaller / larger)^2)
```

with explicit zero, infinity, and NaN handling. The stock Typed Racket optimization is modeled on this current BC implementation, so its comment is accurate when “Racket runtime” means BC.

Current Racket CS instead defines float-complex magnitude in terms of its internal `flhypot`, which reaches the registered C entry `"(cs)hypot"` and ultimately libm `hypot`. Consequently, applying the stock TR optimization under CS replaces the runtime's more accurate libm calculation with the less accurate BC-style formula.

The stock TR expansion also uses generic `zero?` on an otherwise unboxed imaginary component. Replacing it with `(unsafe-fl= i 0.0)` reduces allocation from 8503 MB to 6822 MB. The 1681 MB difference over 104,129,299 iterations is about 16 bytes per iteration: one boxed flonum. This is an independent optimizer bug and a straightforward fix.

## Accuracy

The MPFR comparison uses 256-bit `bfhypot` as the reference. For 102,615 component pairs captured from this Mandelbrot workload:

| Formula | Exactly rounded | 1 ULP | At least 2 ULP | Maximum |
|---|---:|---:|---:|---:|
| Racket CS/libm `hypot` | 102026 (99.426%) | 589 | 0 | 1 ULP |
| Stock ratio formula | 63896 (62.268%) | 38456 | 263 | 2 ULP |
| Hybrid formula | 85261 (83.088%) | 17354 | 0 | 1 ULP |

On the large- and small-finite stress sets, libm `hypot` was exactly rounded for 8186/8192 and 8180/8192 inputs, respectively, and was always within one ULP. The ratio formula was exactly rounded for 4684/8192 and 4658/8192, with 70 and 76 results differing by two ULP. The hybrid deliberately falls back to the ratio formula at extreme magnitudes, so its extreme-value results are the same as the ratio formula.

Herbie retained direct `hypot(x,y)` unchanged (`100% -> 100%`). It found no algebraic replacement with a better accuracy score. The saved reports and the complete MPFR output are under `experiments/herbie/` and `results/accuracy-mpfr.txt`.

## Why magnitude-only changes have a small ARM payoff

The initial experiments changed only the escape-test magnitude while retaining the source-level complex recurrence:

```racket
(iterate (+ i 1) (+ (* z z) c))
```

TR does split a `Float-Complex` value into real and imaginary components in its expanded code. That does not make the whole recurrence allocation-free. The expanded recurrence contains two `real->double-flonum` coercions around the results of the generated complex arithmetic, and its recursive loop boundary still exposes boxed scalar values to the backend.

The allocation totals quantify this. `typed-zfl-alt-mag` allocates 6822 MB, while the otherwise comparable scalar/cached version allocates 3502 MB. The 3320 MB difference is 31.9 bytes per iteration, almost exactly two 16-byte flonums. The scalar local-function version itself drops from 3502 MB to 119 MB when rewritten as an immediately applied typed named loop, another 32.5 bytes per iteration. Thus the magnitude-only versions retain roughly four boxed flonums per hot iteration even though the TR log describes the complex expression as unboxed.

On x86, eliminating the expensive runtime magnitude calculation is enough to hide much of this remaining work. On ARM, the scaled formula's floating-point division and the surviving allocation/coercion work dominate. Fixing `zero?` removes one box but leaves those costs, so the fixed ratio version is still 3.8% slower than `inexact.rkt` on ARM.

The squared-magnitude experiment separates `sqrt` from the complex-representation cost. Removing `sqrt` changes 3251 ms to 2695 ms on ARM, but 644 ms to 655 ms on x86 within normal run variation. ARM benefits materially from avoiding that operation, yet the result still allocates 6822 MB and reaches only a 1.45x speedup. Magnitude is no longer the main remaining bottleneck.

## Where the remaining boxes come from

After the generic `zero?` fix, the complex variants retain approximately four 16-byte flonums per hot iteration. Two independent allocation differences identify them:

- The complex squared-magnitude variant allocates 6822 MB, while the scalar version with the same duplicated-square recurrence allocates 3502 MB. The 3320 MB difference is 31.9 bytes per iteration: two flonums.
- The scalar local-procedure variant allocates 3502 MB, while the immediately applied named loop allocates 119 MB. The 3383 MB difference is 32.5 bytes per iteration: two more flonums.

The first pair is introduced directly by `n-ary->binary/non-floats` in TR's float-complex optimizer. In the branch where neither operand is marked as non-float, the old code nevertheless wrapped the accumulated component in `real->double-flonum` before an unsafe flonum operation. In the Mandelbrot recurrence, that accumulator is already the result of `unsafe-fl-` or `unsafe-fl+`. Passing it to the generic coercion first requires a boxed Racket value. The patch on branch `avoid-redundant-float-complex-coercions` passes the known flonum directly instead.

The second pair is caused by the recursive local-procedure boundary. Chez keeps the two component arguments boxed for the `define`-then-call shape, but recognizes the immediately applied named `let` as a loop and keeps both values in floating-point registers. These boxes are also not semantically necessary, but eliminating them requires a source transformation, a stronger TR loop transformation, or improved Chez analysis.

With only the first pair removed, the squared complex benchmark falls from 6822 MB to 3485 MB. Its x86 time falls from 655 ms to 424 ms, and its ARM time falls from 2695 ms to 889 ms. The patched complex code is then essentially tied with the analogous scalar code; the remaining gap is the second boxed pair.

## Why boxing is especially expensive on the tested ARM machine

An isolated 100-million-iteration loop compared two flonum recurrences. The first kept both values in floating-point registers. The second applied `real->double-flonum` to both already-flonum results on every iteration.

| Isolated loop | x86 time | ARM time | Allocation | GC time, x86 / ARM |
|---|---:|---:|---:|---:|
| Raw unboxed recurrence | 119 ms | 296 ms | about 0.9 MB | 0 / 0 ms |
| Two redundant coercions | 327 ms | 1829 ms | about 3205 MB | 3 / 11 ms |
| Added cost | 208 ms | 1533 ms | about 3204 MB | 3 / 11 ms |

The small GC totals show that collection is not the main cost. The coercing loop allocates each 16-byte flonum in the nursery, stores the floating-point result, spills live Scheme state, calls the generic `real->double-flonum` procedure, performs its type checks, restores state, and later reloads the double from the box.

The AArch64 disassembly uses four `movz`/`movk` instructions to materialize each full procedure address, followed by an indirect branch through the procedure object. The primitive performs tag and header checks and another indirect transfer. The x86 sequence implements the same boxed calling convention more compactly, and the newer Core Ultra processor executes the dependent calls, branches, and memory traffic much faster than the Neoverse N1. The ARM penalty is therefore in mutator-side boxing and generic-call machinery, not primarily in garbage collection or floating-point arithmetic.

Chez already knows how to eliminate its internal `real->flonum` and `$real->flonum` primitives when `known-flonum-result?` proves the argument is a flonum. Racket CS's `real->double-flonum`, however, reaches Chez as a call to a separately compiled Racket wrapper. Its compiler metadata describes a foldable procedure but does not expose the identity-on-flonum rule or the unboxed result path. Chez therefore cannot apply its existing primitive optimization at this call site. Making the Racket operation a compiler-recognized intrinsic could eliminate the call too, but avoiding the redundant call in TR is smaller and also applies to Racket BC.

## Racket CS to Chez intrinsic connection

Branch `cs-intrinsic-real-to-double-flonum`, commit `c2afc30141`, changes the Racket CS primitive metadata from `known-procedure/folding` to a small cross-module inline expansion:

```racket
(lambda (x)
  (if (flonum? x)
      x
      (if (real? x)
          (exact->inexact x)
          (raise-argument-error 'real->double-flonum "real?" x))))
```

The first prototype expanded directly to Chez `real->flonum`. That eliminated the hot call but changed a bad-argument error from `real->double-flonum` to Chez's rewritten name `->fl`. A second prototype retained an inlined `real?` guard. It preserved the error, but AArch64 did not eliminate the guard: the isolated loop took 342 ms instead of 296 ms despite eliminating all allocation. The final flonum-first expansion exposes the exact identity case and leaves the original conversion and error behavior in a cold fallback.

With the final expansion, the isolated 100-million-iteration coercing loop is indistinguishable from the raw loop:

| Final intrinsic microbenchmark | x86 | ARM | Allocation |
|---|---:|---:|---:|
| Raw recurrence | 119-120 ms | 295-296 ms | about 0.9 MB |
| Two `real->double-flonum` calls | 119 ms | 296-300 ms | about 0.9 MB |

The final AArch64 disassemblies are textually identical. The x86 instruction streams are also identical; only relocated literal and runtime-code addresses differ. The public bad-argument message remains `real->double-flonum: contract violation`.

Unmodified Typed Racket with this Racket branch takes 520 ms on x86 and 2347 ms on ARM, allocating 5170 MB on each. Those results match the separate TR coercion patch within normal variation. The Racket change therefore removes the two TR-generated coercion boxes for all Racket CS clients, while the TR patch remains useful for Racket BC and avoids generating redundant operations in the first place.

The Racket optimizer regression now enables the existing comparison showing that `(real->double-flonum (fl+ z z))` compiles like `(fl+ z z)` under Chez Scheme. The complete optimizer file could not be run from the copied, uninstalled worktree because its package bytecode had an incompatible FASL version. The rebuilt x86 and ARM microbenchmarks, disassembly comparisons, contract-error check, and byte-for-byte Mandelbrot comparison all passed.

## Why Lucas's scalar versions are faster

`typed-scalar.rkt` carries `zr` and `zi` as separate `Float` arguments. This avoids the generated complex multiply/add machinery and its two extra per-iteration coercion boxes. Its `math/flonum` `flhypot` is the same scaled-division algorithm, but it is defined inside `begin-encourage-inline` and receives scalar arguments directly. Even with the division, scalarization improves the result to 483 ms on x86 and 1836 ms on ARM.

For this escape test, the program does not need magnitude itself. While the previous point is inside the Mandelbrot radius, the next point remains small enough that squaring cannot approach floating-point overflow. Testing

```racket
(<= (+ (* zr zr) (* zi zi)) 4.0)
```

therefore avoids both division and square root for this workload. That produces 437 ms on x86 and 922 ms on ARM. ARM's speedup grows from 2.13x for scalar `flhypot` to 4.25x for the squared test, directly showing the larger ARM cost of the magnitude operations.

Caching `zr^2` and `zi^2` so they are reused in the recurrence saves another 5-6%. The larger change is expressing the recurrence as an immediately applied, result-annotated named loop instead of defining a recursive local procedure and calling it afterward. The expanded forms are both `letrec` based, but only the immediate application gives the Chez optimizer a loop shape where it keeps the two loop-carried flonums unboxed. Allocation falls from 3502 MB to 119 MB, and ARM time falls from 870 ms to 570 ms.

`typed-opt.rkt` then uses explicit row and column loops, hoists corner and scale conversions, computes byte offsets once, and gives the indices fixnum types. The generic-integer isolation variant is nearly identical on x86 but takes 481 ms instead of 453 ms on ARM, so fixnum specialization is a secondary ARM-only gain here. Both allocate only 51 MB.

The final ARM gap is also generated-code overhead rather than magnitude:

- Replacing `(* zr zi 2.0)` with one multiply followed by `p+p` changes 453 ms to 410 ms on ARM and about 288 ms to 278 ms on x86. The dependent second multiply is much more costly on the Neoverse N1.
- Replacing only checked `(fx+ i 1)` with `(unsafe-fx+ i 1)` changes 410 ms to 343 ms on ARM and has no reliable x86 effect. That overflow check executes about 104 million times. The surrounding condition `i < max_iter`, together with a positive-fixnum `max_iter`, is enough to prove that the addition cannot overflow, but TR does not currently exploit that fact.
- Making the remaining index conversions, fixnum operations, and byte copy unsafe changes 343 ms to 329 ms. Lucas's roofline version reaches 324 ms.

The broad conclusion is that ARM is not inherently getting little benefit from unboxing. Once the whole loop is scalarized and its loop-carried values stay unboxed, the ARM result is 12.1x faster than `inexact.rkt`, compared with 4.78x on x86. The magnitude-only TR changes failed to show that gain because they left complex coercions, loop-boundary boxing, checked fixnum arithmetic, and ARM-expensive division or square root in the hot loop.

## libm `hypot` access paths

An ordinary Racket FFI wrapper calls libm accurately but boxes around the call. It is effectively tied with `inexact.rkt` on x86 and 18% slower on ARM.

The experimental compiler-known `unsafe-flhypot` primitive keeps the surrounding computation unboxed. It is effectively tied with `inexact.rkt` on x86 and 5.1% faster on ARM. It preserves libm accuracy but remains slower than the hybrid or workload-specific squared test.

Racket CS already registers the relevant C function as `"(cs)hypot"`, so TR can emit this without introducing a Racket-level primitive:

```racket
((#%foreign-inline
  (foreign-procedure __atomic "(cs)hypot"
                     (double-float double-float)
                     double-float)
  #:copy*)
 x y)
```

The plain name `"hypot"` is not registered and fails. The `__atomic` annotation is essential on x86: without it, the run took 5146 ms and allocated 16911 MB; with it, the run took 762 ms and allocated 6822 MB.

The same atomic form takes 16367 ms and allocates 13548 MB on the Neoverse N1. A standalone microbenchmark also allocates about 80 bytes per call there. The ARM backend does not preserve the unboxed chain through this foreign-procedure application. This route is also specific to Racket CS, because the embedded datum is Chez Scheme code. It is a good x86 experiment but not a portable replacement for a compiler-known primitive unless the AArch64 foreign-call lowering is improved.

## Concrete optimization opportunities

1. Change the generated generic `zero?` to `unsafe-fl=`. This removes one allocation per magnitude call.
2. Remove the `real->double-flonum` coercion boxes introduced by generated float-complex multiplication and addition. Implemented and tested on branch `avoid-redundant-float-complex-coercions`, commit `c63c8ed4`.
3. Expose the identity-on-flonum case for Racket CS `real->double-flonum` so Chez can eliminate redundant calls from any client. Implemented and tested on branch `cs-intrinsic-real-to-double-flonum`, commit `c2afc30141`.
4. Arrange generated scalar recurrences as immediate loops, or otherwise communicate loop-carried flonum types to Chez so recursive calls remain unboxed.
5. Use range information from `i < max_iter` to replace the hot checked `fx+` with `unsafe-fx+` when `max_iter` is a positive fixnum.
6. Consider strength reduction for multiplication by exactly `2.0` where the floating-point semantics are acceptable.
7. Investigate AArch64 lowering of `#%foreign-inline` `foreign-procedure` calls with `double-float` arguments/results.
8. For workload code such as Mandelbrot, prefer a squared-radius predicate instead of computing magnitude. This is a source-level algorithmic optimization, not a valid general implementation of `magnitude`.

## Experimental branches

- Racket `flhypot`: branch `flhypot`, commit `1cb4f05769`.
- Racket CS coercion intrinsic: branch `cs-intrinsic-real-to-double-flonum`, commit `c2afc30141`.
- Typed Racket: branch `use-flhypot`, commits `8c8af219`, `5bc1455f`, and `1819ebda`.
- Typed Racket redundant-coercion fix: branch `avoid-redundant-float-complex-coercions`, commit `c63c8ed4`.
- Math library: branch `use-racket-flhypot`, commit `3fd5a82`.

Those worktrees live under the ignored `checkouts/` directory. Raw benchmark logs are under `results/`; source variants are under `benchmarks/`; expansions, disassembly, MPFR inputs, and Herbie reports are under `experiments/`.
