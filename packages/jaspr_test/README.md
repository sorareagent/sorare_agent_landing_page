# jaspr_test

Testing utilities for the jaspr framework.

A simple component test looks like this:

```dart
import 'package:jaspr_test/jaspr_test.dart';

import 'app_bulma.dart';

void main() {
  group('simple component test', () {
    late ComponentTester tester;

    setUp(() {
      tester = ComponentTester.setUp();
    });

    test('should render component', () async {
      await tester.pumpComponent(App());

      expect(find.text('Count: 0'), findsOneComponent);

      await tester.click(find.tag('button'));

      expect(find.text('Count: 1'), findsOneComponent);
    });
  });
}
```

Checkout the tests use by jaspr itself for more examples: 
[jaspr/test](https://github.com/schultek/jaspr/tree/main/jaspr/test)