module Styles exposing (..)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)



{-| A reusable style. Css.batch combines multiple styles into one, much
like mixins in CSS preprocessors.
-}
h1Font : Style
h1Font =
    Css.batch
        [fontFamilies ["Rubik"]
        , fontWeight bold
        , fontSize (rem 4)
        ]

paragraphFont : Style
paragraphFont =
    Css.batch
        [ fontFamilies [ "Palatino Linotype", "Georgia", "serif" ]
        , fontSize (px 16)
        , fontWeight normal
        ]

colstyle : Int -> Style
colstyle number =
    Css.batch
    [
    textAlign center
    , float left
    , width (pct (100/ toFloat number)) 
    ]

rowstyle : Style 
rowstyle =
    Css.batch
    [
        after 
        [ 
        display Css.table
        ]
    ]

headroomUnfixedStyle : Style
headroomUnfixedStyle =
    Css.batch
    [position relative
    , flex auto
    , height (px 60)
    , backgroundColor (hex "353747")]

navBarLinks : Style
navBarLinks =
    Css.batch
    [ margin (px 5)
     , color (hex "fff")
     , textDecoration none
     , fontSize (rem 1.5)
     , hover [ color (hex "bbb")]
     ]