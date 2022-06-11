module Main where

import Data.Text (Text)


main :: IO ()
main = putStrLn "Hello, Haskell!"

data Energy
    = Colorless | Grass | Fire | Water | Lightning
    | Fighting | Psychic | Darkness | Metal | Dragon

type Natural = Int

data Attack = Attack
    { attackName :: Text
    , cost :: [Energy]
    , damage :: Natural
    }

data Card = Card
    { name :: Text
    , typ :: Energy
    , hp :: Natural
    , attacks :: [Attack]
    }
