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


