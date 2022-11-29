module Grains (square, total) where

square :: Integer -> Maybe Integer
square n = if n < 1 || n > 64 then Nothing else Just (2 ^ (n - 1))

total :: Integer
total = 2 ^ 64 - 1
