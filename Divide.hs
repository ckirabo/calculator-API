{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE DeriveGeneric #-}

module Divide where 

import Foundation
import Yesod.Core
import Data.Aeson
import GHC.Generics
import Calc

getDivR :: Int -> Int -> Handler TypedContent
-- getDivR _ 0 = "Invalid"
getDivR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Divide"
        [whamlet|#{x} / #{y} = #{z}|]
    provideJson $ object ["First" .= x,
                          "Operator" .= '/',
                          "Second" .= y,
                          "result" .= z]
  where
    z = div x y