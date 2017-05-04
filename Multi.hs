{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE DeriveGeneric #-}

module Multi where

import Foundation
import Yesod.Core
import Data.Aeson
import GHC.Generics
import Calc

getMultiR :: Int -> Int -> Handler TypedContent
getMultiR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Multiplication"
        [whamlet|#{x} * #{y} = #{z}|]
    provideJson $ object ["First" .= x,
                          "Operator" .= '*',
                          "Second" .= y,
                          "result" .= z]
  where
    z = x * y
 