import numpy as np

test_input = \
"7 6 4 2 1\n"\
"1 2 7 8 9\n"\
"9 7 6 2 1\n"\
"1 3 2 4 5\n"\
"8 6 4 4 1\n"\
"1 3 6 7 9\n"


with open('puzzle_input.txt', 'r') as f:
    test_input = f.read()

test_array = test_input.split('\n')[:-1]
test_array = [[int(i) for i in j.split(' ')] for j in test_array]

def test_line(line):
    monotonic_ascending = True
    monotonic_descending = True
    jump = False

    for i in range(len(line)-1):
        if line[i+1] > line[i]:
            monotonic_descending = False
        if line[i+1] < line[i]:
            monotonic_ascending = False

        if not (1 <= abs(line[i+1] - line[i]) <= 3):
            jump = True

    #print(monotonic_ascending, monotonic_descending, jump)

    return (monotonic_ascending or monotonic_descending) and not jump


lines = [test_line(i) for i in test_array]

print(lines.count(True))
