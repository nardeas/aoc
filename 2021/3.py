import numpy as np

# Input as multiline string to array of ints
x = np.asarray([ list(j) for j in puzzle_input_string.splitlines() ], int)

# Compute mask from transpose
m = (x.T.sum(axis=1) * 2 >= x.shape[0]).astype(int)

# Mask to decimal
def unmask(m):
  return int(''.join(map(str, m)), 2)

# Divide and conquer for the second part
def search(x, pos=0, inv=False):
  if x.shape[0] > 1:
    return search(
      x[np.where(x[:, pos] == (x[:, pos].sum() * 2 >= x.shape[0]) ^ inv)],
      pos=pos + 1,
      inv=inv
    )
  return x.flatten()

# Part 1: gamma rate * epsilon rate
unmask(m ^ 0) * unmask(m ^ 1)

# Part 2: oxygen rate * co2 rate
unmask(search(x, inv=False)) * unmask(search(x, inv=True))
