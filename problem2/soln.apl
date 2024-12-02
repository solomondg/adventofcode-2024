⎕IO ← 0
]box on
]rows on


⍝  silver:
p_input ← ⍎¨⊃⎕NGET'puzzle_input.txt' 1 ⍝ Load input into int vector

      +/{((⍵[⍋⍵]≡⍵) ∨ (⍵[⍒⍵]≡⍵)) ∧ (⌊/(|2-/⍵)∊(1+⍳3))}¨p_input

Explanaion:
(⍵[⍋⍵]≡⍵) ∨ (⍵[⍒⍵]≡⍵)) ⍝  Check to see if either w is monotonically increasing or decreasing (e.g. check if sorted(w) == w)
(⌊/(|2-/⍵)∊(1+⍳3)) ⍝ Take the gradient of w and check to see if abs(Δw) is all within 1-3


⍝  gold:
      {(⊃p_test)[⍸(~⍵⍷(1+⍳5))]}¨(1+⍳5) ⍝  Test - drops vectors  -- note need to compensate for lenght of vec
      +/{pp ← ⍵ ⋄  0<+/{((⍵[⍋⍵]≡⍵) ∨ (⍵[⍒⍵]≡⍵)) ∧ (⌊/(|2-/⍵)∊(1+⍳3))}¨({(pp)[⍸(~⍵⍷(1+⍳⍴pp))]}¨(1+⍳1+⍴pp))} ¨ p_input ⍝  Gross solution
      ⍝  Explanation: ({(pp)[⍸(~⍵⍷(1+⍳⍴pp))]}¨(1+⍳1+⍴pp)) makes all permutations of `pp` possible by dropping 0-1 elements
      ⍝  We need to make `pp` tmpvar due to ¨ operator erasing ⍵, this could be done much better

