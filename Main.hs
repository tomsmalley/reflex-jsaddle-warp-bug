module Main where

import qualified Bug
import Language.Javascript.JSaddle.Warp

main :: IO ()
main = run 3800 Bug.main
