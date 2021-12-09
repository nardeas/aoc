import numpy as np

# Input as 2d array
x = np.asarray([

# Forward direction
  [int(b), 0] if a[0] == 'f' else
  
# Down direction
  [0, int(b)] if a[0] == 'd' else
  
# Up direction
  [0, -int(b)] \

for a, b in map(str.split, puzzle_input_string.splitlines())])

# Compute aim for the second part
x = np.concatenate([x, x[:, 1].cumsum()[:, np.newaxis]], axis=-1)

# Part 1:
x[:, 0].sum() * x[:, 1].sum()

# Part 2:
x[:, 0].sum() * (x[:, 0] * x[:, 2]).sum()
