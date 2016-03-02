# How to implement custom control for file upload

How to implement a file upload itself see in `upload` example.

## Clonning N2O upload element

Create `include` directory in your project (`apps/sample/include`). Create a record `custom_upload.hrl` there:
```
-record(custom_upload, {?CTRL_BASE(element_custom_upload), name, value}).
```
(this is a copy of the record `#upload{}` in `deps/nitro/include/nitro.hrl`).

Go to `deps/nitro/src/elements/` and copy file `element_upload.erl` to the source directory of your example (`apps/sample/src` in this project). Then rename file and module to, for example, `element_custom_upload`. Edit it to get the following:
```
-module(element_custom_upload).
-compile(export_all).
-include_lib("nitro/include/nitro.hrl").
-include("custom_upload.hrl").

render_element(#custom_upload{id=Id} = U) ->
    Uid = case Id of undefined -> wf:temp_id(); I -> I end,
    bind(ftp_open,  click,  "qi('upload').click(); e.preventDefault();"),
    bind(ftp_start, click,  "ftp.start();"),
    bind(ftp_stop,  click,  "ftp.stop();"),
    bind(nitro:to_atom(Uid), change, "ftp.init(this.files[0],false);"),
    Upload = #panel  { body = [
             #input  { id   = Uid,         type    = <<"file">>, style = "display:none" },
             #span   { id   = ftp_status,  body    = [] },
             #span   { body = [
             #button { id   = ftp_open,    body = "Browse" },
             #button { id   = ftp_start,   body = "Upload" },
             #button { id   = ftp_stop,    body = "Stop" }
    ] } ] }, wf:render(Upload).

bind(Control,Event,Code) ->
    wf:wire(#bind{target=Control,type=Event,postback=Code}).
```

Then replace an element in the `index.erl`:
```
event(init) ->
    wf:update(upload,#custom_upload{id=upload});
```

