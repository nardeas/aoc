-- DAY 8:
--
-- Each instruction consists of several parts: the register to modify,
-- whether to increase or decrease that register's value, the amount by
-- which to increase or decrease it, and a condition. If the condition
-- fails, skip the instruction without modifying the register
--
-- ...What is the largest value in any register after completing the
-- instructions in your puzzle input?
--
-- ...What is the highest value held in any register during this
-- process?

import Data.List
import Data.Maybe

-- Returns named condition result
test f x y
  | f == ">" = x > y
  | f == "<" = x < y
  | f == "==" = x == y
  | f == ">=" = x >= y
  | f == "<=" = x <= y
  | f == "!=" = not (x == y)

-- Returns named operation result
call f x y
  | f == "inc" = x + y
  | f == "dec" = x - y

-- Returns ((vars, statics, ops)...)
ops x = map
  (\y -> (
    (y !! 0, y !! 4),
    (read (y !! 2) :: Int, read (last y) :: Int),
    (y !! 1, y !! 5)
    ))
  (
  map
    (\y -> words y)
    (lines x)
  )

-- Returns solutions (pt1, pt2)
solve [] y v m = (maximum v, m)
solve x [] [] m = solve x (nub (intercalate [] [[a, b] | (a, b) <- map (\(y,_,_) -> y) x])) [] m
solve x y [] m = solve x y (replicate (length y) 0) m
solve (x:xs) y v m = solve xs y v_ m_
  where m_ = max (maximum v_) m
        v_ = take ai v ++ [if (test f bv d) then (call e av c) else av] ++ drop (ai+1) v
        ai = fromJust $ elemIndex a y
        bi = fromJust $ elemIndex b y
        av = v !! ai
        bv = v !! bi
        (a, b) = vars
        (c, d) = statics
        (e, f) = ops
        ((vars, statics, ops)) = x

-- Problem solver
main = readFile "8.in" >>= \x ->
  print $ solve (ops x) [] [] 0
