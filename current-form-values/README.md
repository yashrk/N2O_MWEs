# How to start process from server side

## Use wf:wire/1 to send JavaScript and HTML to client

You can use `wf:wire/1` to edit page on client side and to run JavaScript on client side too.

## Use ws.send() to send messages from client

To send value of form with id "message" to server we use the following:
```
    wf:wire("ws.send(enc(tuple(atom('client'), tuple(atom('message'), bin(document.getElementById('message').value)))));");
```

All client messages must (probably) be tuples starting with `{client, ...}`. The rest of the tuple can (probably) contain any Erlang literals.