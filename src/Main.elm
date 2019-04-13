module Main exposing (main)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Styles exposing (..)
import Elements exposing (..)




{-| A plain old record holding a couple of theme colors.
-}
theme : { secondary : Color, primary : Color }
theme =
    { primary = hex "55af6a"
    , secondary = rgb 250 240 230
    }

mycolors : {black : Color}
mycolors =
    { black = rgb 0 0 0}


{-| Css.property lets you define custom properties, using strings as their values.
-}
legacyBorderRadius : String -> Style
legacyBorderRadius amount =
    Css.batch
        [ property "-moz-border-radius" amount
        , property "-webkit-border-top-left-radius" amount
        , property "-webkit-border-top-right-radius" amount
        , property "-webkit-border-bottom-right-radius" amount
        , property "-webkit-border-bottom-left-radius" amount
        , property "border-radius" amount
        ]

{- Actual HTML stuff:
-}


view : Model -> Html Msg
view model =
    div [ css [backgroundColor (rgb 116 97 145)]]
        [ topNav
        , twoColumns Elements.logo (text "Smol cute pics of animals or whatever") 
        , upcomingEvents
        , blogPosts
        , text lorem 
        ]

main : Program () Model Msg
main =
    Browser.sandbox
        { view = view >> toUnstyled
        , update = update
        , init = initialModel
        }


update : Msg -> Model -> Model
update msg model =
    model


type Msg
    = DoSomething


type alias Model =
    ()


initialModel : Model
initialModel =
    ()