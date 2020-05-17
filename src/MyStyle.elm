module MyStyle exposing (..)

import Html exposing (Attribute, Html, div)
import Html.Attributes as Attrs


class : String -> Attribute msg
class name =
    Attrs.class <| "app__" ++ name


mr : String -> Attribute msg
mr gap =
    Attrs.style "margin-right" gap


ml : String -> Attribute msg
ml gap =
    Attrs.style "margin-left" gap


m : String -> Attribute msg
m gap =
    Attrs.style "margin" gap


mt : String -> Attribute msg
mt gap =
    Attrs.style "margin-top" gap


mb : String -> Attribute msg
mb gap =
    Attrs.style "margin-bottom" gap


p : String -> Attribute msg
p gap =
    Attrs.style "padding" gap


column : List (Attribute msg) -> List (Html msg) -> Html msg
column attrs children =
    div ([ class "column" ] ++ attrs) children


row : List (Attribute msg) -> List (Html msg) -> Html msg
row attrs children =
    div ([ class "row" ] ++ attrs) children


rowCenter : Attribute msg
rowCenter =
    Attrs.style "justify-content" "center"



-- wrap : Attribute msg
-- wrap =
--     Attrs.style "flex-wrap" "wrap"


fill : Float -> Attribute msg
fill a =
    Attrs.style "flex-grow" (String.fromFloat a)


g04 : String
g04 =
    "0.4rem"


g08 : String
g08 =
    "0.8rem"


flexItem : List (Attribute msg) -> List (Html msg) -> Html msg
flexItem attrs children =
    div ([ Attrs.style "flex-basis" "0" ] ++ attrs) children



-- flexItem :
--     (List (Attribute msg) -> List (Html msg) -> Html msg)
--     -> List (Attribute msg)
--     -> List (Html msg)
--     -> Html msg
-- flexItem n attrs =
--     n (List.concat [ [ Attrs.style "flex-basis" "0%" ], attrs ])
