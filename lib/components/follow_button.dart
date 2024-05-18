import 'package:jaspr/jaspr.dart';

class FollowButton extends StatelessComponent {
  const FollowButton({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield a(href: 'https://twitter.com/SorareAgent', classes:'button is-info', styles: Styles.raw({
      'position': 'absolute',
      'width': '211px',
      'display': 'flex',
      'bottom': '48px',
    }), [
      span(classes: 'icon', [
        i(classes: 'fab fa-twitter', []),
        span(styles: Styles.raw({'margin-left': '12px'}), [text('Follow @SorareAgent')]),
      ]),
    ]);
  }
}
