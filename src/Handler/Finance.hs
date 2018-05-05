{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Finance where

import Import

postFinanceR :: Handler Html
postFinanceR = defaultLayout $ do
    let handlerName = "getHomeR" :: Text
    $(widgetFile "homepage")