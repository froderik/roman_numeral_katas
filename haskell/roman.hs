module Main( main ) where

import System.Environment
import System( getArgs )
import System.Console.GetOpt
 
main = do 
     args <- getArgs
     let number = rInt (head args)
--     let number = 12
     putStr ((times (number `quot` 1000) "M") ++ 
            (timesSmaller ((number `quot` 100) `mod` 10) "C" "D" "M") ++
            (timesSmaller ((number `quot` 10) `mod` 10) "X" "L" "C") ++
            (timesSmaller (number `mod` 10) "I" "V" "X") ++ "\n")

times 0 _ = ""
times n s = take n (cycle s)

timesSmaller n a b c
             | n <= 0 = ""
             | n <= 3 = times n a
             | n <= 4 = a ++ b
             | n <= 8 = b ++ times (n-5) a
             | n <= 9 = a ++ c
             | otherwise = "Only single digits allowed!"

rInt :: String -> Int
rInt = read