module Pages exposing (..)

import Browser
import Css exposing (..)
--import Html exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Styles exposing (..)
import Asset

home : Html msg
home =
    div [ css [pageWrapper]] [ p [] [text ("this is home")]]

about : Html msg
about =
    div [ css [pageWrapper]] [ p [] [text ("this is about")]]

events : Html msg
events =
    div [ css [pageWrapper]] [ p [] [text ("this is events")]]

blog : Html msg
blog =
    div [ css [pageWrapper]] [ p [] [text ("this is blog")]]

team : Html msg
team =
    div
    [ css [pageWrapper]]
    [ p [] [text ("this is TEAM"), teamWrapper]]

teamWrapper : Html msg
teamWrapper =
    div
    [ css [
--    TODO NO NATIVE SUPPORT FOR CSS GRID, WHAT DO?
--      margin: 0 auto;
--      display: grid;
--      grid-template-columns: 400px 400px 400px;
--      grid-template-rows: 400px;
--      grid-row-gap: 20px;
--      width: 75%;
--      justify-content: space-around;
--      align-content: space-around;
            margin2 zero auto
            , border3 (px 2) solid (hex "00FFFF")
--          , display
    ]]
    [text ("teamWrapper here")
    , img [Asset.src Asset.possum] []
    ]

contact : Html msg
contact =
    div [ css [pageWrapper]] [ p [] [text ("this is contact")]]