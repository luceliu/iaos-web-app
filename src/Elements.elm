module Elements exposing (..)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Styles exposing (..)

threeColumns: String -> String -> String -> Html msg
threeColumns text1 text2 text3 =
    div [ css [rowstyle]]
            [
                div [ css [colstyle 3]]
                [ text text1 ]
                , div [css [colstyle 3]]
                [text text2 ]
                , div [css [colstyle 3]]
                [text text3 ]
            ]

twoColumns: Html msg -> Html msg ->  Html msg
twoColumns text1 text2 =
    div [ css [rowstyle]]
            [
                div [ css [colstyle 2]]
                [  text1 ]
                , div [css [colstyle 2]]
                [ text2 ]
            ]

{-| A logo image, with inline styles that change on hover.
-}
logo : Html msg
logo =
    img
        [ src "assets/logo.jpg"
        , css
            [ display inlineBlock
            , padding (px 20)
            , border3 (px 5) solid (rgb 120 120 120)
            , borderRadius (pt 50)
            , hover
                [ borderColor (rgb  0 0 0)
                , borderRadius (px 10)
                ]
            ]
        ]
        []

headroom : Html msg
headroom =
    div [ css
            [ headroomUnfixedStyle ]
        ]
    [topNav]

-- Nav bar is within a div wrapper 'headroom'
topNav : Html msg
topNav =
--    Attributes
    nav
        [ css
        [ ] ]
--    Children
    [
     a [href "/about"] [text ("About")]
     , a [href "/events"] [text ("Events")]
     , a [href "/blog"] [text ("Blog")]
     , a [href "/team"] [text ("Team")]
     , a [href "/contact"] [text ("Contacts")]
    ]

upcomingEvents : Html msg
upcomingEvents = 
    div []
    []

blogPosts : Html msg
blogPosts = 
    div []
    []

{-| A reusable button which has some styles pre-applied to it.
-}
btn : List (Attribute msg) -> List (Html msg) -> Html msg
btn =
    styled button
        [ margin (px 12)
        , color (rgb 200 230 0)
        , hover
            [ backgroundColor (rgb 10 30 40)
            , textDecoration underline
            ]
        ]

lorem : String 
lorem = 
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu consequat ligula. Sed pulvinar quis nibh vel commodo. Morbi interdum, magna vitae elementum vulputate, lorem massa auctor neque, a maximus purus erat sit amet ex. Aliquam consequat elit a orci hendrerit lacinia. Fusce lacinia finibus metus sit amet sagittis. Praesent hendrerit justo in nibh mattis accumsan. Fusce a massa id diam blandit rhoncus aliquam ac lorem. Sed eget lacus lacinia, fringilla quam id, pellentesque lorem. In sed nibh eget elit volutpat dapibus. Nullam scelerisque efficitur sem at feugiat. Integer luctus, nunc id scelerisque facilisis, nunc nibh laoreet dolor, vitae egestas libero enim a magna. Donec sit amet commodo lorem.

    Nullam quis suscipit nisl. Aenean commodo massa eget urna accumsan tincidunt. Maecenas pretium ipsum id vulputate vehicula. Aenean congue, libero sit amet vehicula vehicula, diam augue rhoncus enim, in pretium nisl neque sed nisl. Donec ultricies, ipsum ut eleifend vehicula, dolor sapien porta neque, non facilisis quam nulla gravida nulla. Maecenas ac sem cursus, posuere mi at, ultrices metus. Nunc rhoncus est et egestas hendrerit. Fusce a tortor dictum, pellentesque odio condimentum, mattis metus. Donec magna est, molestie quis nulla sed, pellentesque rutrum sapien. Phasellus vestibulum nisi nec turpis congue tincidunt.

    Proin ut felis tincidunt, dictum orci ac, tempus nisi. Nullam blandit lobortis ligula, ut pretium felis dapibus aliquam. Phasellus elementum laoreet turpis, sed mollis neque mollis id. Ut sagittis semper sapien, nec commodo lectus malesuada nec. Duis laoreet vitae felis nec efficitur. Nulla accumsan lacinia dapibus. Fusce efficitur mauris ut risus hendrerit, id sollicitudin dui pellentesque. Quisque sollicitudin feugiat quam, et bibendum purus dapibus eu.

    Nulla sit amet commodo justo, a consequat velit. In fermentum tortor id velit cursus pretium. Nulla iaculis, augue ac rhoncus ultricies, eros lorem egestas quam, vitae vehicula lectus ligula sed elit. Curabitur at condimentum ligula. Nulla porta, ipsum quis interdum tempus, urna ligula facilisis augue, eu dapibus turpis sapien porttitor erat. Suspendisse mi nibh, sodales a sem ac, varius vestibulum ligula. In ac consectetur metus. Curabitur in bibendum erat. Maecenas consequat quam sed orci ultricies fermentum. Proin magna lorem, vestibulum vitae pretium sit amet, mattis et purus. Cras volutpat elit vel arcu condimentum, ac malesuada neque efficitur. Sed non tellus sed dolor laoreet suscipit. Integer vitae quam blandit, pretium urna a, ultrices velit.

    Quisque laoreet hendrerit ligula, et porttitor mauris molestie a. Aenean pretium maximus ipsum nec convallis. Quisque feugiat, nisl id lobortis lacinia, ipsum arcu dignissim sem, convallis vestibulum sapien metus sit amet felis. Praesent facilisis iaculis tristique. Integer non ligula massa. Nulla molestie ullamcorper odio, ut molestie tortor imperdiet at. Praesent quis suscipit diam. Nulla consectetur velit at ipsum varius lobortis. Aenean leo purus, consectetur sit amet justo et, finibus feugiat sapien.

    Sed tortor justo, laoreet eu nunc vel, commodo dapibus ligula. Etiam sed placerat orci. Quisque pulvinar massa nisi, eget cursus purus posuere non. Praesent scelerisque viverra nunc quis sodales. Quisque congue mauris dui, vitae fringilla velit vehicula rutrum. Morbi lacinia maximus magna, eget pretium libero blandit pellentesque. Sed porta elit neque, vitae sodales sapien dictum id. Donec mollis condimentum tortor, a tincidunt nulla pretium vitae. Phasellus condimentum suscipit purus at dapibus. Vivamus et massa sit amet nisi vestibulum imperdiet. Integer velit sapien, fringilla et sapien id, tristique laoreet justo. Nam id molestie dolor. Aliquam venenatis neque in massa finibus consectetur. Sed vulputate blandit faucibus.

    Pellentesque urna odio, congue eu mattis vel, lacinia vel ante. Nulla facilisi. In a auctor ante, sit amet finibus elit. Nullam non pellentesque nibh. Nunc suscipit est ut cursus tempus. Vivamus nec risus ac libero auctor posuere. Cras at pharetra nunc, ac viverra dolor. Nunc risus diam, consectetur nec eros nec, tempor pellentesque mi. Morbi cursus dui vel dui feugiat pulvinar. Donec placerat lacus neque, eget faucibus erat viverra at. In hac habitasse platea dictumst. Sed ullamcorper tellus elit, vel porttitor tortor iaculis a.

    Aenean sed arcu tempor enim rhoncus mattis. Morbi ut tortor ut quam eleifend pharetra. Proin sed est ornare, finibus augue in, efficitur velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas aliquam sapien tristique, congue est vel, placerat ipsum. Donec aliquet feugiat pretium. Integer dictum ipsum dolor, vitae bibendum metus semper eu. Sed faucibus suscipit dui ac placerat. Donec congue elit orci, a ultrices purus elementum tempus.

    Integer in massa in lectus venenatis cursus ac aliquam enim. Integer at dolor vitae leo finibus varius vitae sed leo. Etiam dui velit, porttitor id egestas nec, faucibus vitae lorem. Pellentesque viverra tellus nec enim cursus, non interdum tortor ultricies. Praesent dignissim tellus ut ipsum consectetur, sit amet tristique dui tempus. Ut tincidunt neque vel augue pharetra vestibulum. Quisque eget pellentesque sapien. Morbi venenatis metus id efficitur feugiat. Donec ac ipsum ac enim cursus tincidunt eget lacinia libero. Mauris dictum justo sapien, id commodo odio ullamcorper at. Nulla sollicitudin quam vel luctus volutpat.

    Mauris lacinia, ligula vel tempus cursus, elit ipsum finibus arcu, vel tempus ligula est eget quam. In hac habitasse platea dictumst. Fusce posuere felis eu diam interdum, nec finibus risus scelerisque. Curabitur commodo, ante quis laoreet dignissim, mi magna ornare orci, et cursus lacus urna at nulla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed diam ante, viverra ut consequat nec, viverra quis leo. Donec fringilla lectus ipsum, mattis congue lacus vehicula eu. Praesent a arcu bibendum, feugiat ante sed, cursus ante.

    Nam aliquam ante lacus, sit amet pellentesque libero commodo non. In in magna ultricies, ultrices lorem a, convallis sapien. Etiam faucibus elementum lacus, ultrices congue ex consequat ac. Suspendisse luctus dolor sem, imperdiet efficitur neque iaculis eu. Etiam quis elit augue. Vivamus auctor mattis felis, et porttitor mi tincidunt sed. Mauris at lectus et lacus vulputate porta. Quisque eu felis a lorem faucibus ultrices. Sed commodo eget ante eu vulputate. Praesent quis nunc et ligula molestie rhoncus ut non dolor. Praesent a est eu quam euismod posuere. Aenean vel diam eleifend, cursus ipsum non, congue ex. Quisque massa enim, laoreet a metus vitae, laoreet interdum purus. Quisque malesuada egestas nibh, nec aliquam turpis pretium a.

    Integer viverra placerat turpis, posuere ultricies quam vestibulum vitae. Vestibulum in tempus velit. Quisque ullamcorper, ligula pharetra cursus tincidunt, tellus nunc convallis ipsum, ultricies bibendum risus magna id massa. Curabitur sagittis lorem ligula, elementum pellentesque erat scelerisque a. Donec placerat facilisis ligula sit amet sagittis. Sed aliquet felis velit, a pulvinar sapien congue non. Mauris diam sem, pulvinar quis sem sit amet, ornare imperdiet turpis. Nunc vitae dui nec dolor eleifend maximus ac a massa. Vestibulum tempor pharetra erat vel consequat. Mauris auctor sollicitudin eros, et accumsan lorem pharetra in. Cras vehicula mi sit amet porttitor vulputate. Aliquam sollicitudin metus odio.

    Suspendisse vel diam orci. Fusce rutrum massa quis dui facilisis cursus. Maecenas massa nulla, sodales accumsan ante eget, tempus feugiat lacus. Proin vel ex non tortor varius dignissim. Suspendisse vel interdum velit. Sed auctor convallis enim, ut porttitor metus viverra ut. Maecenas sollicitudin, metus id vestibulum dapibus, urna sem sollicitudin turpis, vitae mattis neque nulla nec ipsum. Curabitur rutrum placerat leo, non gravida sem laoreet vitae. In feugiat arcu urna, quis scelerisque nisl cursus at. Aliquam erat volutpat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur id sapien sed ante tincidunt commodo.

    Mauris in condimentum arcu, quis malesuada mauris. Cras posuere sed dolor non mollis. Donec mollis interdum justo rutrum faucibus. Phasellus in nibh sed quam venenatis dignissim sit amet ut orci. Nulla sed ornare eros, nec luctus nulla. Pellentesque non diam egestas, tempor libero a, aliquam sem. Quisque posuere nisl mauris, vitae interdum magna tristique vel. Cras et eros egestas turpis convallis lobortis nec ac est. In hac habitasse platea dictumst. Nulla eu imperdiet purus, id suscipit mi. Mauris vulputate blandit odio ac cursus. Suspendisse ut diam at ligula blandit tristique. In rutrum, sapien non pellentesque imperdiet, est urna imperdiet justo, a pulvinar mi dui at purus. Phasellus at consectetur ipsum. Donec eleifend congue purus.

    Integer vestibulum arcu nisi, vel auctor justo dignissim at. Nunc feugiat ligula vitae massa luctus, nec dictum ipsum venenatis. Vestibulum tincidunt hendrerit justo, non rhoncus eros tempor et. Nullam et gravida lectus. Morbi ut ultrices felis. Aliquam aliquet turpis sed est lacinia pulvinar. In metus tortor, porta ut dui id, suscipit pharetra magna. Donec accumsan facilisis lorem, quis interdum diam interdum nec. Curabitur justo lacus, consequat nec risus id, porta faucibus arcu. Curabitur fringilla arcu eros, sit amet dictum tellus condimentum eget.
    """
