-- DAY 1:
--
-- Below the message, the device shows a sequence of changes in frequency
-- (your puzzle input). A value like +6 means the current frequency increases
-- by 6; a value like -3 means the current frequency decreases by 3.

main = do
  input <- readFile "1.in"
  print $
    sum $
      map
        -- Convert to int
        (\x -> read x :: Int)
        $ map
          -- Remove plus sign
          (\line -> [ char | char <- line, not (char `elem` "+") ])
          (lines input)
