-- DAY 2:
--
-- To make sure you didn't miss any, you scan the likely candidate boxes
-- again, counting the number that have an ID containing exactly two of
-- any letter and then separately counting those with exactly three of
-- any letter. You can multiply those two counts together to get a
-- rudimentary checksum and compare it to what your device predicts.
--
-- For example, if you see the following box IDs:
--
-- abcdef contains no letters that appear exactly two or three times.
-- bababc contains two a and three b, so it counts for both.
-- abbcde contains two b, but no letter appears exactly three times.
-- abcccd contains three c, but no letter appears exactly two times.
-- aabcdd contains two a and two d, but it only counts once.
-- abcdee contains two e.
-- ababab contains three a and three b, but it only counts once.
--
-- Of these box IDs, four of them contain a letter which appears exactly
-- twice, and three of them contain a letter which appears exactly three
-- times. Multiplying these together produces a checksum of 4 * 3 = 12.
--
-- What is the checksum for your list of box IDs?
import Data.List

dupecount :: String -> Int -> Int
dupecount [] count = count
dupecount ss count = dupecount (drop x ss) y
  where
    s = head ss
    x = (length . filter (s==)) ss
    y = count + if
      ((x == 3 && count `elem` [0, 2]) ||
       (x == 2 && count `elem` [0, 3]))
      then x
      else 0

main = do
  input <- readFile "2.in"
  print $
    (\counts -> (
      length [x | x <- counts, x == 2 || x == 5 ]) * (
      length [x | x <- counts, x == 3 || x == 5 ])
    ) $ map
        (\line -> dupecount (sort line) 0)
        (lines input)
