# Counter

Inside `counter.dart` we want to build a working counter component.

The UI for a counter consists of two parts:

1. A text displaying the current value and
2. A button that increments the value when clicked

---

## Events

A [DomComponent] can have a set of events, each given a name and a callback. When the dom element triggers
a specified event, the callback is invoked.

A [DomComponent] listening to a *click* event looks like this:

```
DomComponent(
  tag: ...,
  events: {
    'click': (event) {
      // do something
    },
 },
 child: ...
);
```

# Task

1. Inside [Counter]s State add a new `int count` variable and initialize it to zero.
2. Display the count value using the [Text] component in the format `Count: <count>`.
   <details>
     <summary>Tip</summary>
     Use String interpolation with `'Count: $count'`.
   </details>
3. Add a new button element beneath the text element and give it a `click` event handler.
4. Increment the count inside the event handler and trigger a rebuild.
   <details>
     <summary>Tip</summary>
     Use `setState(() { ... });`.
   </details>