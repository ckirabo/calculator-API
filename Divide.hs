{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE DeriveGeneric #-}

module Divide where 

import Foundation
import Yesod.Core
import Data.Aeson
import GHC.Generics
import Calc

-- remember to take in consideration the constraints this will have--

getDivR :: Int -> Int -> Handler TypedContent
-- getDivR _ 0 = "Invalid Operation"
getDivR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Divide"
        [whamlet|#{x} / #{y} = #{z}|]
    provideJson $ object ["First" .= x,
                          "Operator" .= '/',
                          "Second" .= y,
                          "result" .= z]--json representation--
  where
    z = div x y
    

-- fix "Invalid Operation" part used pattern matching. 
-- for if it becomes a decimal round up 

-- for line 23 used div as it divids as ints rather than as floating types when (x/y) is done 