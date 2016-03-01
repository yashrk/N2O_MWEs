# How to get file upload work in N2O

## Add ftp.js to JavaScript files on your page

Here is full list of JavaScript files included in example page:
```
<script src='/n2o/protocols/bert.js'></script>
        <script src='/n2o/protocols/client.js'></script>
        <script src='/n2o/protocols/nitrogen.js'></script>
        <script src='/n2o/bullet.js'></script>
        <script src='/n2o/xhr.js'></script>
        <script src='/n2o/utf8.js'></script>
        <script src='/n2o/template.js'></script>
        <script src='/n2o/n2o.js'></script>
        <script src='/n2o/validation.js'></script>
        <script src='/n2o/ftp.js'></script>
        <script>protos = [$client,$bert]; N2O_start();</script>
```

May be, some of this files are in fact not needed (comments and pull requests are welcome).

## Insert 'upload' nitro element to your page

You need `#upload{}` nitro element or your own element with the same functionality:
```
wf:update(upload,#upload{id=upload});
```

## Set your upload directory

Add to your `sys.config` file, to `n2o` section, a tuple with the path to upload directory:
```
{upload,"./apps/sample/priv/static/"},
```

That's all! An upload should work now.
