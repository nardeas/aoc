-- DAY 1:
--
-- Find the sum of all digits that match the next digit in the list.
-- The list is circular, so the digit after the last digit is the first digit
-- in the list.

-- Returns digits with pairs
a :: String -> String
a [] = ""
a [x] = ""
a [x, y] = if x == y then [x] else ""
a (x:y:xs) = a [x, y] ++ a ([y] ++ xs)

-- Returns sum of digits from numeric string
b :: String -> Int
b [] = 0
b (x:xs) = do
  case (\c -> lookup c (zip ['0'..'9'] [0..9])) x of
  -- Add to sum
    Just n -> n + b xs
  -- Skips invalid
    Nothing -> b xs

-- Problem solver
main = do
  -- Read input file
  input <- readFile "1.in"
  -- Output final sum
  putStrLn . show $ (
  -- Find sum
    b (
  -- Find pairs
      a (
  -- Append head to tail
        (\(x:xs) -> [x] ++ xs ++ [x])
  -- Trim newlines
          $ (reverse . dropWhile (=='\n') . reverse $ input)
        )
      )
    )
