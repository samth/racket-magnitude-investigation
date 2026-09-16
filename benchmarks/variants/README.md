# Isolation variants

These programs were added to identify which source changes account for the performance gap.

- `typed-zfl-squared-mag.rkt` keeps float-complex state but compares squared magnitude with 4, isolating square-root cost.
- `typed-scalar-cached.rkt` reuses the two component squares, isolating duplicated multiplication.
- `typed-scalar-named-let.rkt` makes the scalar recurrence an immediately applied, result-annotated loop, exposing loop-carried flonums to Chez.
- `typed-opt-generic.rkt` changes Lucas's `typed-opt.rkt` back to generic integer types while retaining its explicit loop structure.
- `typed-opt-cross-add.rkt` computes the imaginary update as `p+p` instead of `p*2.0`.
- `typed-opt-cross-add-four.rkt` additionally carries 4.0 as a loop argument; it did not help on either machine.
- `typed-opt-cross-add-unsafe-i.rkt` additionally makes only the hot iteration increment unsafe.
- `typed-opt-cross-add-unsafe.rkt` additionally makes all index arithmetic, index-to-flonum conversions, and byte copying unsafe.
