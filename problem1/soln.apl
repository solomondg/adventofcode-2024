⎕IO ← 0
]box on
]rows on

p_input ← ⍎¨⊃⎕NGET'puzzle_input.txt' 1 ⍝ Load input into int vector

⍝ Silver star
 +/{|(0⊃⍵)-(1⊃⍵)}({{⍵[⍒⍵]}⍵⌷[1]↑p_input}¨⍳2) ⍝ First attempt, gross
 +/↑|-/({{⍵[⍒⍵]}⍵⌷[1]↑p_input}¨⍳2) ⍝ Second attempt, using map reduce for row subtraction
 +/↑|-/{⍵[⍒⍵]}¨(↓⍉↑p_input) ⍝ Third attempt, using map onto array rows
 ⍝ Note - couldn't find a way around the {⍵[⍒⍵]}, but that's fine


 Gold star:

 row1 ← 0⊃(↓⍉↑p) ⍝  First attempt
 row2 ← 1⊃(↓⍉↑p)
 +/{⍵×+/⍵=row2}¨row1

 ⍝  disgusting garbage solution:
       {row1 ← 0⊃(↓⍉↑⍵) ⋄ row2 ← 1⊃(↓⍉↑⍵) ⋄ +/{⍵×+/⍵=row2}¨row1}p_input 

⍝  ideal: want to not have to do specific assigns
+/{(↓1⊃⍵){⍵×+/⍵=⍺}¨(0⊃⍵)}(↓⍉↑p_input) ⍝  Not perfect, but better: ideally would like to have the (0⊃⍵) and (1⊃⍵) auto populated from row split

