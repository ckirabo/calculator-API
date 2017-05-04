{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE DeriveGeneric #-}


module Add where

import Foundation
import Yesod.Core
import Data.Aeson
import GHC.Generics
import Calc

getAddR :: Int -> Int -> Handler TypedContent
getAddR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Addition"
        [whamlet|#{x} + #{y} = #{z}|]
    provideJson $ object ["First" .= x,
                          "Operator" .= '+',
                          "Second" .= y,
                          "result" .= z]


  where
    z = x + y
