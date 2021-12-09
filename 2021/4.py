import numpy as np

draws, *boards = puzzle_input_string.split('\n\n')

# Get draws as array, without zeros
n = np.asarray(draws.split(','), int) + 1

# Get boards as array, without zeros
b = np.asarray([[a.split() for a in b.splitlines()] for b in boards], float) + 1

# Result winning order
w = []

# Draw numbers one by one and set matching board position to zero
for num in n:
  b[b == num] = 0
  
  # Find success mask
  h = np.any(b.sum(axis=-1) == 0, axis=-1)
  v = np.any(b.swapaxes(1, 2).sum(axis=-1) == 0, axis=-1)
  
  # Find idx, score by mask
  for m in (h, v):
    if m.any() and (i := np.argwhere(m)[0]) > -1:
      
      # Compute score
      if (score := (num - 1) * (b[i].sum() - (b[i] > 0).sum())) > 0:
      
        # Add to results
        w.append([ i.item(),  score ])

        # Disable board
        b[i] = -1
      
w = np.asarray(w, int)

# Part 1:
w[0, 1]

# Part 2:
w[-1, 1]
