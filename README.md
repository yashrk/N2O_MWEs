# Minimal working examples for different N2O features

[N2O](https://github.com/synrc/n2o/) is an innovative, fast, open source, but not too well documented web framework for Erlang.

Here are my examples of using different N2O features.

## Tools needed

You need to download [mad](https://github.com/synrc/mad). Run following commands in the root directory of the project:

```
wget https://github.com/synrc/mad/raw/master/mad
chmod +x mad
```

## How to run examples

```
cd $EXAMPLE_NAME
../mad deps compile plan repl
```

Then open in browser http://localhost:8001

## How to create your own example

Run following command in the root directory of the project:

```
./mad app $EXAMPLE_NAME
```

