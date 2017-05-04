{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Home where

import Foundation
import Yesod.Core

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
    setTitle "Minimal Multifile"
    [whamlet|

 <h1>Calcultor Operations <h1>  
 
 <h2> Html Calcultor <h2> 

 <h3> Click links below for a HTML representation of a Calculator and type in URL <h3> 
        <p>
            <a href=@{AddR 5 7}>Add Calcultor HTML Version
        <p>

         <p>
            <a href=@{SubR 5 7}>Subtraction Calcultor HTML Version
        <p>

         <p>
            <a href=@{MultiR 5 7}>Multiplication Calcultor HTML Version
        <p>

         <p>
            <a href=@{DivR 5 7}>Division Calcultor HTML Version
        <p>
          <p>
            <a href=@{SquareR 5 }>Square Calcultor HTML Version
        <p>

        <p>
            <a href=@{PowerR 5 2 }>Power Calcultor HTML Version
        <p>


      

<h2> Json Calcultor <h2>

<h3> Click links below for a JSON representation of a Calcultor and type in URL <h3> 

        <p>
           <a href=@{AddR 5 7}?_accept=application/json>JSON Calculator Addition   
        <p>

         <p>
          <a href=@{SubR 5 7}?_accept=application/json>JSON Calculator Subtraction
         <p>

         <p>
           <a href=@{MultiR 5 7}?_accept=application/json>JSON Calculator Multiplication
         <p>

         <p>   
             <a href=@{DivR 5 7}?_accept=application/json>JSON Calculator Division
         <p>

         <p>   
             <a href=@{SquareR 5 }?_accept=application/json>JSON Calculator Sqaure
         <p>
           
         <p>   
             <a href=@{PowerR 5 2 }?_accept=application/json>JSON Calculator Power
         <p>


    |]
