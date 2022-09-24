import 'package:jaspr/jaspr.dart' hide Color;
import 'package:sorare_agent_landing_page/components/bulma/button.dart';
import 'package:sorare_agent_landing_page/components/bulma/colors.dart';

void main() {
  runApp(App());
}

/// Top level component for the web app
class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield SorareAgentText();
    yield Avatar();
    yield Description();
    yield Button(
      child: Text('Primary'),
      color: Color.primary,
      onPressed: () {},
    );
  }
}

/// The Sorare Agent text component
class SorareAgentText extends StatelessComponent {
  const SorareAgentText({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'h1',
      styles: Styles.raw({
        'font-family': 'Homenaje',
        'font-size': '48px',
      }),
      child: Text(
        'Sorare Agent',
      ),
    );
  }
}

class Avatar extends StatelessComponent {
  const Avatar({Key? key}) : super(key: key);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
        tag: 'img',
        classes: ['image-cover', 'top'],
        styles: Styles.raw({
          'width': '220px',
          'height': '220px',
          'border': '1px solid white',
          'border-radius': '50%',
          'margin': '20px',
          'object-fit': 'cover',
          'object-position': 'center',
        }),
        attributes: {
          'src': 'https://avatars.githubusercontent.com/u/113435489?s=200&v=4'
        });
  }
}

/// Description component which describes what Sorare Agent does
class Description extends StatelessComponent {
  const Description({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
        tag: 'span',
        styles: Styles.raw({
          'font-size': '18px',
          'margin-top': '24px',
        }),
        child: Text(
          'Reporting the latest transfers for Sorare licensed clubs',
        ));
  }
}
