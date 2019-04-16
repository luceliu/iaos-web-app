module Pages exposing (..)

import Browser
import Css exposing (..)
--import Html exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Styles exposing (..)

home : Html msg
home =
    div [ css [ border3 (px 5) solid (rgb 120 120 120) ]] [ p [] [text ("this is home")]]

about : Html msg
about =
    div [ css [ border3 (px 10) solid (rgb 2 5 100) ]] [ p [] [text ("this is about")]]

events : Html msg
events =
    div [ css [ border3 (px 10) solid (rgb 2 50 5) ]] [ p [] [text ("this is events")]]

blog : Html msg
blog =
    div [ css [ border3 (px 10) solid (rgb 200 50 5) ]] [ p [] [text ("this is blog")]]

team : Html msg
team =
    div [ css [ border3 (px 10) solid (rgb 50 50 150) ]] [ p [] [text ("this is TEAM")]]

contact : Html msg
contact =
    div [ css [ border3 (px 10) solid (rgb 100 100 5) ]] [ p [] [text ("this is contact")]]

default : Html msg
default =
    div [] [text ("should never get here")]
