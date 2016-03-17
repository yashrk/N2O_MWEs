-module(index).
-compile(export_all).
-include_lib("n2o/include/wf.hrl").
-include_lib("nitro/include/nitro.hrl").

message() -> wf:js_escape(wf:html_encode(wf:to_list(wf:q(message)))).
main()    -> #dtl{file="index",app=sample,bindings=[{body,body()}]}.
body()    -> [ #panel{id=history}, #textbox{id=message},
               #button{id=send,body="Start",postback=start} ].

event(init) -> wf:reg(room);
event(start)-> 
    wf:info(?MODULE, "Start event received", []),
    wf:wire("ws.send(enc(tuple(atom('client'), tuple(atom('message'), bin(document.getElementById('message').value)))));");
event({client,{message, Message}}) ->
    wf:info(?MODULE, "Got message: ~p", [Message]),
    wf:insert_bottom(history, #panel{id=history,body=[Message,#br{}]});
event(Event) -> wf:info(?MODULE,"Unknown Event: ~p~n",[Event]).
