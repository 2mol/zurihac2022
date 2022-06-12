{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.IO
import System.Clock
-- import Control.Exception

import Formatting
import Formatting.Clock
import qualified Data.ByteString as B


main :: IO ()
main = do
    start <- getTime Monotonic

    handle <- openBinaryFile "randomfile" ReadMode
    readChunkWhile handle
    hClose handle

    end <- getTime Monotonic
    fprint (timeSpecs % "\n") start end


readChunkWhile handle = do
    bla <- B.hGetSome handle (4*1024)
    if B.length bla > 0
        then readChunkWhile handle
        else pure ()
