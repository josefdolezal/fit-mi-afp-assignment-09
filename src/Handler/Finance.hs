{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Finance where

import Import
import Model.FinanceRecord

postFinanceR :: Handler Html
postFinanceR = defaultLayout $ do
    let records = [] :: [FinanceRecord]
    redirect HomeR