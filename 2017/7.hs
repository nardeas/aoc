-- DAY 7:
--
-- One program at the bottom supports the entire tower. It's
-- holding a large disc, and on the disc are balanced several
-- more sub-towers. At the bottom of these sub-towers, standing
-- on the bottom disc, are other programs, each holding their
-- own disc, and so on. At the very tops of these sub-sub-sub-...-towers,
-- many programs stand simply keeping the disc below them balanced but
-- with no disc of their own.
--
-- You ask each program to yell out their name, their weight, and
-- (if they're holding a disc) the names of the programs immediately
-- above them balancing on that disc. You write this information down
-- (your puzzle input).
--
-- ...What is the name of the bottom program?
import Data.List

-- Problem solver
main = readFile "7.in" >>= \s ->
  putStrLn $ (
    -- Find name which is not a child to any parent
    [
      n |
      let y = (
              -- Flatten children
              (\x -> (fst x, intercalate [] (snd x))) $
              -- ([parents], [children])
              unzip (
                map
                  -- (parent, [children])
                  (\x -> (
                    -- Collect parents
                    head x,
                    -- Collect children
                    map
                    -- Trim commas
                      (\z -> reverse . dropWhile (==',') $ (reverse z))
                      (drop 3 x))
                    )
                  -- Find lines with children
                  (map words (filter (\x -> elem '>' x) (lines s)))
              )
              ),
      -- Loop through [Parents]
      n <- (fst y),
      -- Filter Parents that are not Children
      n `notElem` snd y
    -- First element
    ] !! 0
  )
