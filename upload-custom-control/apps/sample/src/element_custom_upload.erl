-module(element_custom_upload).
-compile(export_all).
-include_lib("nitro/include/nitro.hrl").
-include("custom_upload.hrl").

render_element(#custom_upload{id=Id} = U) ->
    bind(ftp_open,  click,  "qi('upload').click(); e.preventDefault();"),
    bind(ftp_start, click,  "ftp.start();"),
    bind(ftp_stop,  click,  "ftp.stop();"),
    bind(upload,   change, "ftp.init(this.files[0],false);"),
    Upload = #panel  { body = [
             #input  { id   = upload,     type    = <<"file">>, style = "display:none" },
             #span   { id   = ftp_status,  body    = [], style = "display:none" },
             #span   { body = [
             #button { id   = ftp_open,    body = "Browse" },
             #button { id   = ftp_start,   body = "Upload" },
             #button { id   = ftp_stop,    body = "Stop", style = "display:none" }
    ] } ] }, wf:render(Upload).

bind(Control,Event,Code) ->
    wf:wire(#bind{target=Control,type=Event,postback=Code}).
