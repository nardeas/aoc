-- DAY 3:
--
-- Each square on the grid is allocated in a spiral pattern starting at a
-- location marked 1 and then counting up while spiraling outward. For example,
-- the first few squares are allocated like this:
--
-- 17  16  15  14  13
-- 18   5   4   3  12
-- 19   6   1   2  11
-- 20   7   8   9  10
-- 21  22  23 --> ...
--
-- ...requested data must be carried back to square 1 (the location of the only
-- access port for this memory system) by programs that can only move up, down,
-- left, or right. They always take the shortest path: the manhattan distance
-- between the location of the data and square 1.

-- Returns grid size n given input i
a i = x + (x `mod` 2 + 1) where x = (floor $ sqrt (fromIntegral i))

-- Returns corners [a, b, c, d] for grid size n
b n = [n^2 - n*x + x | x <- [0..3]]

-- Returns edges given input
c i = last [[x, y] | x <- z, y <- z, x > i && y < i] where z = b . a $ i

-- Returns manhattan distance given input
d i = (a i) - 1 - abs ((c i) !! 0 - i)

-- Problem solver
main = do
  -- Read input file
  input <- readFile "3.in"
  -- Strategy:
  -- (1) find grid size n for input i
  -- (2) find all corner values [a, b, c, d] for grid
  -- (3) find edge [a, b] for input i
  -- (4) find difference d from corner a for input i
  -- (5) manhattan distance = (n - 1 - d)
  print . d $ (read input :: Int)
