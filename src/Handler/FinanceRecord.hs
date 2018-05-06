{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.FinanceRecord where

import Import

getFinanceRecordR :: Integer -> Handler Html
getFinanceRecordR id = defaultLayout $ do
    let record = (FinanceRecord "a" 1 1)
    $(widgetFile "finance")

putFinanceRecordR :: Integer -> Handler Html
putFinanceRecordR id = defaultLayout $ do
    redirect (FinanceRecordR 1000)

deleteFinanceRecordR :: Integer -> Handler Html
deleteFinanceRecordR id = defaultLayout $ do
    redirect (FinanceRecordR 1000)