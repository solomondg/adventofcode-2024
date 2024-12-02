import numpy as np

test_input = \
"7 6 4 2 1\n"\
"1 2 7 8 9\n"\
"9 7 6 2 1\n"\
"1 3 2 4 5\n"\
"8 6 4 4 1\n"\
"1 3 6 7 9\n"


test_array = test_input.split('\n')[:-1]
test_array = [[int(i) for i in j.split(' ')] for j in test_array]
test_array = np.asarray(test_array)

#def test_line(line):
#
