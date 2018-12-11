-- DAY 4:
--
-- A valid passphrase must contain no duplicate words.
--
-- For example:
--
-- aa bb cc dd ee is valid.
-- aa bb cc dd aa is not valid - the word aa appears more than once.
-- aa bb cc dd aaa is valid - aa and aaa count as different words.

-- Returns list of words for each line in string
input :: String -> [[String]]
input s = map words (lines s)

-- Problem solver
main = readFile "4.in" >>= \s ->
  print $ (
    -- Result: good passphrase count
    length (
      -- Compare and filter tuples of word counts
      filter
        (\x -> fst x == snd x)
        -- Create tuples of word counts per line...
        (zip
          -- ...of original input
          (map length (input s))
          -- ...of deduped input
          (map length (
            map
              -- Remove duplicates per line to compare word count
              -- with original line word count
              (foldr (\x y -> if x `elem` y then y else x : y) [])
              (input s)
            )
          )
        )
      )
    )
