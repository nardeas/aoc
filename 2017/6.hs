-- DAY 6:
--
-- The reallocation routine operates in cycles. In each cycle, it finds
-- the memory bank with the most blocks (ties won by the lowest-numbered
-- memory bank) and redistributes those blocks among the banks. To do this,
-- it removes all of the blocks from the selected bank, then moves to the
-- next (by index) memory bank and inserts one of the blocks. It continues
-- doing this until it runs out of blocks; if it reaches the last memory
-- bank, it wraps around to the first one.
--
-- The debugger would like to know how many redistributions can be done
-- before a blocks-in-banks configuration is produced that has been seen before.

import Data.List
import Data.Maybe

-- Returns list rearranged and first index of max as tuple
a x = (drop (i+1) x ++ take i x ++ [m], i)
  where m = maximum x
        i = fromJust $ elemIndex m x

-- Returns original list from rearranged and first index of max
b (x, i) = drop n (init x) ++ [last x] ++ take n x
  where n = (length x) - i - 1

-- Returns reallocated list
c x = [if i < z then j+y+1 else j+y | i <- [0..(k-2)], let j = (x !! i)] ++ [y]
  where m = last x
        k = length x
        y = m `div` k
        z = m `mod` k

-- Returns solution by running reallocation until duplicate is found
d x y = if elem j y then (length y)+1 else d j (y ++ [j])
  where (x_, i) = a x
        j = b (c x_, i)

-- Problem solver
main = readFile "6.in" >>= \s ->
  print $ (d (map (\x -> read x :: Int) (words ((lines s) !! 0))) [])
