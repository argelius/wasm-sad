(module
  (memory (export "mem") 256)
  (func (export "sad") (param $ptrA i32) (param $ptrB i32) (param $len i32) (result i32)
    (local $end i32)
    (local $end_unroll i32)
    (local $rem i32)
    (local $sum i32)
    (local $diff i32)
    (local $mask i32)
    (set_local $end (i32.add (get_local $ptrA) (get_local $len)))
    (set_local $rem (i32.rem_u (get_local $end) (i32.const 4)))
    (set_local $end_unroll (i32.sub (get_local $end) (get_local $rem)))
    (block $break (loop $top
      (br_if $break (i32.eq (get_local $ptrA) (get_local $end_unroll)))
      (set_local $diff (i32.sub (i32.load8_u (get_local $ptrA)) (i32.load8_u (get_local $ptrB))))
      (set_local $mask (i32.shr_s (get_local $diff) (i32.const 31)))
      (set_local $diff (i32.xor (get_local $mask) (get_local $diff)))
      (set_local $diff (i32.sub (get_local $diff) (get_local $mask)))
      (set_local $ptrA (i32.add (get_local $ptrA (i32.const 1))))
      (set_local $ptrB (i32.add (get_local $ptrB (i32.const 1))))
      (set_local $sum (i32.add (get_local $sum) (get_local $diff)))
      (set_local $diff (i32.sub (i32.load8_u (get_local $ptrA)) (i32.load8_u (get_local $ptrB))))
      (set_local $mask (i32.shr_s (get_local $diff) (i32.const 31)))
      (set_local $diff (i32.xor (get_local $mask) (get_local $diff)))
      (set_local $diff (i32.sub (get_local $diff) (get_local $mask)))
      (set_local $ptrA (i32.add (get_local $ptrA (i32.const 1))))
      (set_local $ptrB (i32.add (get_local $ptrB (i32.const 1))))
      (set_local $sum (i32.add (get_local $sum) (get_local $diff)))
      (set_local $diff (i32.sub (i32.load8_u (get_local $ptrA)) (i32.load8_u (get_local $ptrB))))
      (set_local $mask (i32.shr_s (get_local $diff) (i32.const 31)))
      (set_local $diff (i32.xor (get_local $mask) (get_local $diff)))
      (set_local $diff (i32.sub (get_local $diff) (get_local $mask)))
      (set_local $ptrA (i32.add (get_local $ptrA (i32.const 1))))
      (set_local $ptrB (i32.add (get_local $ptrB (i32.const 1))))
      (set_local $sum (i32.add (get_local $sum) (get_local $diff)))
      (set_local $diff (i32.sub (i32.load8_u (get_local $ptrA)) (i32.load8_u (get_local $ptrB))))
      (set_local $mask (i32.shr_s (get_local $diff) (i32.const 31)))
      (set_local $diff (i32.xor (get_local $mask) (get_local $diff)))
      (set_local $diff (i32.sub (get_local $diff) (get_local $mask)))
      (set_local $ptrA (i32.add (get_local $ptrA (i32.const 1))))
      (set_local $ptrB (i32.add (get_local $ptrB (i32.const 1))))
      (set_local $sum (i32.add (get_local $sum) (get_local $diff)))
      (br $top)
    ))
    (block $break (loop $top
      (br_if $break (i32.eq (get_local $ptrA) (get_local $end)))
      (set_local $diff (i32.sub (i32.load8_u (get_local $ptrA)) (i32.load8_u (get_local $ptrB))))
      (set_local $mask (i32.shr_s (get_local $diff) (i32.const 31)))
      (set_local $diff (i32.xor (get_local $mask) (get_local $diff)))
      (set_local $diff (i32.sub (get_local $diff) (get_local $mask)))
      (set_local $ptrA (i32.add (get_local $ptrA (i32.const 1))))
      (set_local $ptrB (i32.add (get_local $ptrB (i32.const 1))))
      (set_local $sum (i32.add (get_local $sum) (get_local $diff)))
      (br $top)
    ))
    (get_local $sum)
  )
)
