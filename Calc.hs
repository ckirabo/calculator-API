{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE DeriveGeneric #-}

module Calc where 

import Foundation
import Yesod.Core
import Data.Aeson
import GHC.Generics


data Calc = Calc {
firstValue :: Int,
secondValue :: Int,
operator :: String,
result :: Int
} deriving (Generic)

instance ToJSON Calc