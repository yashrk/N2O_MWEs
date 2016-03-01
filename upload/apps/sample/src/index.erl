-module(index).
-compile(export_all).
-include_lib("n2o/include/wf.hrl").
-include_lib("nitro/include/nitro.hrl").

main() ->
    #dtl{file = "index", app=sample,bindings=[{body,body()}]}.

body() ->
    [ #span{id=upload} ].

event(init) ->
    wf:update(upload,#upload{id=upload});

event(Event) ->
    wf:info(?MODULE,"Event: ~p", [Event]),
    ok.
