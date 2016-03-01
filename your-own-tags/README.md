# How to use your own ErlyDTL tags with N2O

## Get patched mad

Unfortunately, modern ErlyDTL versions with custom tags support are not working in N2O out of the box. But you may use custom mad with ErlyDTL 0.11.0 support.

Create application with `mad app`, then edit URL for mad and version for ErlyDTL in `rebar.config`:
```
    {erlydtl,".*", {git, "git://github.com/evanmiller/erlydtl", {tag, "0.11.1"} }},
    ... 
    {mad,    ".*", {git, "git://github.com/yashrk/mad",         "HEAD"          }},
```

Run `mad deps`. Then go to the `deps/mad` directory and execute `make` command to rebuild mad. Copy new `mad` file to the root directory of the project. Here you are! You now can use modern ErlyDTL.

When [this pull request](https://github.com/synrc/mad/pull/49) will be accepted, this step will be not needed anymore.

## Edit ErlyDTL options

To not to get your dynamically created HTML elements escaped, you must edit ErlyDTL config. Go to file `apps/sample/rebar.config` and add to the tuple `erlydtl_opts` a new element:
```
    {auto_escape, false}
```

Now you must get new ErlyDTL working.

## Creating your own tags

Custom tags behaviour is well described in ErlyDTL documentation, and callback names are self-explanatory, so an example of custom tags module is enough:
```
-module(customtags).
-behaviour(erlydtl_library).

-export([version/0, inventory/1, custom_tag/2]).

version() -> 1.

inventory(filters) -> [];
inventory(tags) -> [custom_tag].

custom_tag(_V,_R) ->
    <<"This is a custom string from custom tag"/utf8>>.
```

To use it you must add a new tuple to the `erlydtl_opts` element in `apps/sample/rebar.config` file:
```
    {default_libraries, [customtags]}
```

Now you can use a new tag in your templates. Add to the template text some code with new tag, for example:
```
<p>{% custom_tag %}</p>
```

It should work now.

