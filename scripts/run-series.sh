#!/usr/bin/env bash
set -euo pipefail

repo_dir=$(cd "$(dirname "$0")/.." && pwd)
racket_bin=${RACKET_BIN:-racket}
cpu=${BENCH_CPU:-0}

run_one() {
  taskset -c "$cpu" "$racket_bin" -y "$1"
}

for name in \
  inexact.rkt \
  typed.rkt \
  typed-zfl-run.rkt \
  typed-zfl-cfl.rkt \
  typed-zfl-alt-mag.rkt \
  typed-scalar.rkt \
  typed-scalar-simpl.rkt \
  typed-opt.rkt \
  roofline.rkt
do
  run_one "$repo_dir/benchmarks/original/$name"
done

for name in \
  typed-zfl-squared-mag.rkt \
  typed-scalar-cached.rkt \
  typed-scalar-named-let.rkt \
  typed-opt-generic.rkt \
  typed-opt-cross-add.rkt \
  typed-opt-cross-add-four.rkt \
  typed-opt-cross-add-unsafe-i.rkt \
  typed-opt-cross-add-unsafe.rkt
do
  run_one "$repo_dir/benchmarks/variants/$name"
done
