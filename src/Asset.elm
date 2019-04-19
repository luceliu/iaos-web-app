module Asset exposing (..)

{-| Assets, such as images, videos, and audio. (We only have images for now.)

We should never expose asset URLs directly; this module should be in charge of
all of them. One source of truth!

-}

import Html.Styled exposing (Attribute, Html)
import Html.Styled.Attributes as Attr


type Image
    = Image String


image : String -> Image
image filename =
    Image ("/assets/images/" ++ filename)

-- IMAGES!!
possum : Image
possum =
    image "possum.jpg"


-- USING IMAGES


src : Image -> Attribute msg
src (Image url) =
    Attr.src url
