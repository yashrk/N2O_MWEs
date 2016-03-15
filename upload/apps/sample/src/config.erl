-module(config).
-compile(export_all).

log_level() -> info.
log_modules() -> %any
    [
     n2o_async,
     n2o_file,
     wf_convert,
     index
    ].
