# 🌊 Riverpod for Jaspr

**TLDR: Differences to flutter_riverpod**

- No ConsumerComponent, just use `context.read` / `context.watch`
- Additional `.onSync()` and `.onPreload()` available on a providers `ref`.

## 👀 Reading and Watching Providers

`jaspr_riverpod` does not have `ConsumerWidget`, `StatefulConsumerWidget` or `Consumer`. This is
because `jaspr_riverpod` relies on the `BuildContext` to read or watch providers instead of 
requiring a separate `WidgetRef` instance.

You can simply read and watch a provider like this:

```dart
final countProvider = StateProvider((ref) => 0);

class Counter extends StatelessComponent {
  Iterable<Component> build(BuildContext context) sync* {
    var value = context.watch(countProvider);
    
    yield Text('Value is $value');
    yield DomComponent(
      tag: 'button',
      events: {'click': (e) => context.read(countProvider.notifier).state++},
      child: Text('Increase'),
    );
  }
}
```

**Why context extensions instead of ConsumerComponent?**

`context.watch` is not feasible in `flutter_riverpod` as explained here:
[github.com/rrousselGit/riverpod/issues/134](https://github.com/rrousselGit/riverpod/issues/134#issuecomment-832600716)

There are long standing bugs (or missing features depending on how you view it) in flutter
with `InheritedWidget` that make it impossible for `context.watch` to work properly (Mainly
here: [github.com/flutter/flutter/issues/62861](https://github.com/flutter/flutter/issues/62861)).

As `jaspr` is basically a complete rewrite of flutters core framework, I went ahead and fixed
these bugs and thereby making `context.watch` feasible again.

**Replacement for Consumer**

Same as with ConsumerComponent, we don't need the Consumer anymore. If you want only parts of your
component tree to rebuild when watching a provider, simply use the `Builder` component. This will
give you a new context on which you can call `context.watch`:

```dart
Builder(
  builder: (context) sync* {
    var value = context.watch(...);
    yield ...;
  },
);
```

## ♻️ Preloading and Syncing Provider State

Jaspr allows `StatefulComponent`s to preload state as well as sync state between server and client 
(when using server-side rendering).

Since providers often are used to replace `StatefulComponent`s, `jaspr_riverpod` offers the same
mechanisms inside a provider, using the `ref.onPreload()` and `ref.onSync()` methods:

Preload state like this:

```dart
final myProvider = Provider<int>((ref) {
  
  ref.onPreload(() async {
    // do some async work on the server
    ref.state = 100;
  });

  return 0;
});
```

Sync state like this:

```dart
final myProvider = Provider<int>((ref) {
  
  ref.onSync<int>(
    id: 'my-provider-id',
    onUpdate: (int? value) {
      ref.state = value ?? ref.state;
    },
    onSave: () {
      return ref.state;
    },
  );

  return 0;
});
```
