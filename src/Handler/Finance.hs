{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Finance where

import Import
import Model.FinanceRecord

getFinanceR :: Handler Html
getFinanceR = defaultLayout $ do
    let records = [] :: [FinanceRecord]
    $(widgetFile "homepage")

postFinanceR :: Handler Html
postFinanceR = defaultLayout $ do
    let records = [] :: [FinanceRecord]
    $(widgetFile "homepage")