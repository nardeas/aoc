-- DAY 2:
--
-- The spreadsheet consists of rows of apparently-random numbers.
-- To make sure the recovery process is on the right track, they
-- need you to calculate the spreadsheet's checksum. For each row,
-- determine the difference between the largest value and the
-- smallest value; the checksum is the sum of all of these
-- differences.

import Data.List

-- Problem solver
main = do
  -- Read input file
  input <- readFile "2.in"
  -- Output result
  print (
    -- Total checksum
    sum (
      map
        -- Difference between highest and lowest
        (\x -> (last x) - (head x))
        (map
          -- Sort
          sort
            (map
            -- Convert to list of integers
            (\y -> map read $ words y :: [Int])
              -- Split lines
              (lines input)
            )
          )
        )
      )
