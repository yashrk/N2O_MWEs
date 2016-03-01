-module(customtags).
-behaviour(erlydtl_library).

-export([version/0, inventory/1, custom_tag/2]).

version() -> 1.

inventory(filters) -> [];
inventory(tags) -> [custom_tag].

custom_tag(_V,_R) -> 
    <<"This is a custom string from custom tag"/utf8>>.

