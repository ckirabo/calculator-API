{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE DeriveGeneric #-}

module Add where

import Foundation
import Yesod.Core
import Data.Aeson
import GHC.Generics
import Calc


--getAddR already provided and used as the method to add--
-- used frame work for all other operations--
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
 

--stack build to check it works --
-- stack exec Kalk to run it--
-- data types are to have caps on first letter--
-- type local host 3000 in browser to see if it works--