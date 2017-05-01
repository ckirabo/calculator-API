{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE ViewPatterns         #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}
module Application where

import Foundation
import Yesod.Core

import Add
import Sub
import Home
import Multi
import Divide
import Calc
--import Database--


mkYesodDispatch "App" resourcesApp

--divide is next to add --
