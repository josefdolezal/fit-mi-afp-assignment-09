{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.FinanceRecord where

import Import

getFinanceRecordR :: Handler Html
getFinanceRecordR = defaultLayout $ do
    let handlerName = "getHomeR" :: Text
    $(widgetFile "homepage")

putFinanceRecordR :: Handler Html
putFinanceRecordR = defaultLayout $ do
    let handlerName = "getHomeR" :: Text
    $(widgetFile "homepage")

deleteFinanceRecordR :: Handler Html
deleteFinanceRecordR = defaultLayout $ do
    let handlerName = "getHomeR" :: Text
    $(widgetFile "homepage")