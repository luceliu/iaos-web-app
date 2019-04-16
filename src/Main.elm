module Main exposing (main)

import Browser exposing (Document, UrlRequest(..))
import Css as CSS exposing (..)
--import Html exposing (..)
--import Html.Attributes exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (onClick)
import Styles exposing (..)
import Elements exposing (..)
import Browser.Navigation as Nav
import Url exposing (Url)
import Url.Parser as UrlParser exposing ((</>))

-- PAGES
import Pages exposing (..)

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
    CSS.batch
        [ CSS.property "-moz-border-radius" amount
        , CSS.property "-webkit-border-top-left-radius" amount
        , CSS.property "-webkit-border-top-right-radius" amount
        , CSS.property "-webkit-border-bottom-right-radius" amount
        , CSS.property "-webkit-border-bottom-left-radius" amount
        , CSS.property "border-radius" amount
        ]


view : Model -> Document Msg

view model =
    let
--        inline =
--            HA.style "display" "inline-block"
--
--        padded =
--            HA.style "padding" "10px"

        menu =
            div [ style "padding" "10px", style "border-bottom" "1px solid #c0c0c0" ]
                [ a [ href "/about" ] [ text "About" ]
                , a [ href "/events" ] [ text "Events" ]
                , a [ href "/blog" ] [ text "Blog" ]
                , a [ href "/team" ] [ text "Team" ]
                , a [ href "/contact" ] [ text "Contact" ]
                ]
        pageBody =
            case model.route of
                Just route ->
                    case Tuple.first route of
                        "about" -> Pages.about
                        "events" -> Pages.events
                        "blog" -> Pages.blog
                        "team" -> Pages.team
                        "contact" -> Pages.contact
                        _ -> Pages.home

                Nothing ->
                    Pages.default

        title =
            case model.route of
                Just route ->
                    Tuple.first route
                        ++ (case Tuple.second route of
                                Just function ->
                                    "." ++ function

                                Nothing ->
                                    ""
                           )

                Nothing ->
                    "Invalid route"
    in
    { title = "URL handling example"
    , body = List.map toUnstyled
        [ menu
        , h2 [] [ text title ]
        , pageBody
        ]
    }

main : Program () Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        , onUrlRequest = ClickLink
        , onUrlChange = ChangeUrl
        }


update : Msg -> Model -> ( Model, Cmd Msg)
update msg model =
    case msg of
        ChangeUrl url ->
            ( { model | route = UrlParser.parse docsParser url }, Cmd.none )

        ClickLink urlRequest ->
            case urlRequest of
                Internal url ->
                    ( model, Nav.pushUrl model.navKey <| Url.toString url )

                External url ->
                    ( model, Nav.load url )


type Msg
    = ChangeUrl Url
    | ClickLink UrlRequest

type alias DocsRoute =
    ( String, Maybe String )

type alias Model =
    { navKey : Nav.Key
    , route : Maybe DocsRoute
    }

init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url navKey =
    ( { navKey = navKey, route = UrlParser.parse docsParser url }, Cmd.none )


docsParser : UrlParser.Parser (DocsRoute -> a) a
docsParser =
    UrlParser.map Tuple.pair (UrlParser.string </> UrlParser.fragment identity)