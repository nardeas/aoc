-- DAY 5:
--
-- The message includes a list of the offsets for each jump.
-- Jumps are relative: -1 moves to the previous instruction,
-- and 2 skips the next one. Start at the first instruction
-- in the list. The goal is to follow the jumps until one
-- leads outside the list.
--
-- In addition, these instructions are a little strange; after
-- each jump, the offset of that instruction increases by 1.
-- So, if you come across an offset of 3, you would move three
-- instructions forward, but change it to a 4 for the next
-- time it is encountered.

-- Returns new offset and new list given offset and list
a :: (Int, [Int]) -> (Int, [Int])
a (x, y) = ((x + n), take x y ++ [n + 1] ++ drop (x + 1) y) where n = y !! x

-- Returns step n at which we exit list
b :: Int -> (Int, [Int]) -> Int
b n (x, y) = if (x >= (length y) || x < 0) then n else b (n+1) (a (x, y))

-- Problem solver
main = readFile "5.in" >>= \s ->
  print (
    -- Find result starting with offset 0
    b  0
      (0, (map
        -- Convert to integers
        (\x -> read x :: Int)
        -- Read lines from input
        (lines s)
      )
    )
  )
