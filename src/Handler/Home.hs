{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Home where

import Import
import Yesod.Form.Bootstrap3
import Text.Julius (RawJS (..))

getHomeR :: Handler Html
getHomeR = do
    records <- runDB $ selectList [] [Desc FinanceRecordId]
    (widget, _) <- generateFormPost $ renderBootstrap3 BootstrapBasicForm inlineFinanceRecordForm
    defaultLayout $(widgetFile "homepage")

postHomeR :: Handler Html
postHomeR = do
    records <- runDB $ selectList [] [Desc FinanceRecordId]
    ((res, widget), _) <- runFormPost $ renderBootstrap3 BootstrapBasicForm inlineFinanceRecordForm
    case res of
        FormSuccess record -> do
            _ <- runDB $ insert record
            redirect HomeR
        _ -> defaultLayout $(widgetFile "homepage")

inlineFinanceRecordForm :: AForm Handler FinanceRecord
inlineFinanceRecordForm = FinanceRecord
    <$> areq textField (attrs "Description") Nothing
    <*> areq doubleField (attrs "Amount") Nothing
    <*> areq intField (attrs "Timestamp") Nothing
    where attrs placeholder = withPlaceholder placeholder (bfs ("" :: Text))
