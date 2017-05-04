{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE DeriveGeneric #-}

module Power where 

import Foundation
import Yesod.Core
import Data.Aeson
import GHC.Generics
import Calc


getPowerR :: Int ->Int -> Handler TypedContent
getPowerR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Power"
        [whamlet|#{x} ^ #{y} = #{z}|]
    provideJson $ object ["First" .= x,
                          "Operator" .= '^',
                          "Second" .= y,
                          "result" .= z]
  where
    z = x ^ y 
    