import numpy as np

# Input as multiline string to array
i = np.asarray(puzzle_input_string.splitlines(), float)

# Edge filter for input x with summing window of size w
f = lambda x, w=1: np.convolve(np.convolve(x, np.ones(w))[(w-1):-w], [1, -1])

# Part 1:
(f(i, 1) > 0).sum()

# Part 2:
(f(i, 3) > 0).sum()
