{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Int
import Data.Time
import Data.Time.Clock.POSIX
import System.IO
import qualified Data.ByteString as B
import Data.Fixed (Pico)


secondsSinceEpoch :: UTCTime -> Pico
secondsSinceEpoch =
    nominalDiffTimeToSeconds . utcTimeToPOSIXSeconds

main :: IO ()
main = do
    start <- getCurrentTime

    handle <- openBinaryFile "randomfile" ReadMode
    readChunkWhile handle
    hClose handle

    end <- getCurrentTime
    print $ (secondsSinceEpoch end - secondsSinceEpoch start)


readChunkWhile handle = do
    bla <- B.hGetSome handle (4*1024)
    if B.length bla > 0
        then readChunkWhile handle
        else pure ()
