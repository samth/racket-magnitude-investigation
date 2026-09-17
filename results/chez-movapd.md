# Chez x86-64 `MOVAPD` experiment

Branch `chez-movapd` changes Chez's x86-64 backend to use full-register `MOVAPD` for floating-point register-to-register copies. Memory loads and stores continue to use scalar `MOVSD`. The patch is commit `52e91bb3f5` on `samth/racket`.

The benchmarks use Racket `789ef10c51`, the zero-test-only Typed Racket checkout at `8c8af219`, CPU 0 affinity, one discarded warmup, five measured runs, allocation measurement, and byte-for-byte comparison with the untyped reference. Each source module was compiled from source in its benchmark process so that the stock and patched runtimes generated their own machine code.

| Benchmark | Stock Chez | `MOVAPD` Chez | Speedup | Allocation, stock / patch |
|---|---:|---:|---:|---:|
| Named loop, TR-scaled `(magnitude z)` | 1241 ms | 329 ms | 3.77x | 102 / 102 MB |
| Named loop, direct `sqrt(zr^2 + zi^2)` | 777 ms | 258 ms | 3.01x | 102 / 102 MB |
| Named loop, squared-radius test | 456 ms | 242 ms | 1.88x | 102 / 102 MB |
| Explicit local function, TR-scaled `(magnitude z)` | 451 ms | 451 ms | 1.00x | 3485 / 3485 MB |

Three process-level repetitions of the exact named-loop `typed-zfl` were 1241, 1241, and 1240 ms with stock Chez, versus 329, 328, and 329 ms with `MOVAPD`. The result is stable and allocation is unchanged.

The squared-radius control shows that the problem was broader than the magnitude temporaries. Partial register copies also created false dependencies among recurrence temporaries and across loop iterations. Removing those dependencies saves 214 ms even when there is no division or square root. After that repair, direct square root adds only 16 ms over the squared predicate, and the scaled magnitude adds 87 ms. The x86 core can overlap most magnitude work with the predicted recurrence once the false dependencies are gone.

The boxed explicit function is unchanged. Its recurrence already reloads components with memory-source `MOVSD`, which writes the whole architectural XMM destination and breaks the old-destination dependency. This unchanged control also rules out a general performance difference between the two Racket builds.

A raw Chez two-component Mandelbrot recurrence confirms the generated instructions. Stock Chez emits five register-to-register `MOVSD` instructions in the loop; the branch emits `MOVAPD` at the same five locations. Memory loads and stores remain `MOVSD`. The disassemblies are saved as `experiments/x86/chez-movapd-stock-asm.txt` and `experiments/x86/chez-movapd-patch-asm.txt`.

Validation completed:

- full Racket CS build, including Chez boot-file fixpoint;
- complete Chez `fl.ms` matrix with no `Bug`, `Error`, or invalid-memory report;
- byte-identical output for all four benchmark variants;
- focused disassembly comparison confirming the intended encodings.
