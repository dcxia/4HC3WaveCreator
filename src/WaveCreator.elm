module WaveCreator exposing (main)

import Browser
import Html exposing (Html)
import Html.Events exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)

-- main
main = 
    Browser.sandbox {init = init, update = update, view = view}

-- model

type alias Model = {
    amplitude : Int 
    }

init: Model
init = 
    Model 0

-- update
type Msg = Increment | Decrement | Res

update : Msg -> Model -> Model
update msg model = 
    case msg of 
        Increment ->
            { model | amplitude = model.amplitude + 1}

        Decrement ->
            { model | amplitude = model.amplitude - 1}

        Res ->
            { model | amplitude = 0}

-- view
view: Model -> Html Msg
view model = 
    svg
    [ viewBox "0 0 400 400"
    , width "400"
    , height "400"
    ]
    [ circle
        [ cx "50"
        , cy "50"
        , r "40"
        , fill "red"
        , stroke "black"
        , strokeWidth "3"
        ]
        []
    , rect
        [ x "100"
        , y "10"
        , width "40"
        , height "40"
        , fill "green"
        , stroke "black"
        , strokeWidth "2"
        ]
        []
    , line
        [ x1 "20"
        , y1 "200"
        , x2 "200"
        , y2 "20"
        , stroke "blue"
        , strokeWidth "10"
        , strokeLinecap "round"
        ]
        []
    , polyline
        [ points "200,40 240,40 240,80 280,80 280,120 320,120 320,160"
        , fill "none"
        , stroke "red"
        , strokeWidth "4"
        , strokeDasharray "20,2"
        ]
        []
    , text_
        [ x "130"
        , y "130"
        , fill "black"
        , textAnchor "middle"
        , dominantBaseline "central"
        , transform "rotate(-45 130,130)"
        ]
        [ text "Welcome to Shapes Club"
        ]
    , text_
        [ x "200"
        , y "200"]
        [text (String.fromInt model.amplitude)]
    ]


{-
    div[]
        [ button [ onClick Decrement ] [ Html.text "-" ]
        , div [] [ Html.text (String.fromInt model.amplitude) ]
        , button [ onClick Increment ] [ Html.text "+" ]
        , button [ onClick Res][Html.text "Reset"]
        ]
-}

