import 'package:jaspr/jaspr.dart';
import 'package:sorare_agent_landing_page/components/follow_button.dart';

class SorareAgent extends StatelessComponent {
  const SorareAgent({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield h1(
        styles: Styles.raw({'font-family': 'Homenaje', 'font-size': '48px'}),
        [text('Sorare Agent')]);
    yield img(
        classes: 'image-cover top',
        styles: Styles.raw({
          'width': '220px',
          'height': '220px',
          'border': '1px solid white',
          'border-radius': '50%',
          'margin': '20px',
          'object-fit': 'cover',
          'object-position': 'center',
        }),
        src: 'https://avatars.githubusercontent.com/u/113435489?s=200&v=4');
    yield span(
        styles: Styles.raw({
          'font-size': '18px',
          'margin-top': '24px',
        }),
        [text('Reporting the latest transfers for Sorare licensed clubs')]);
    yield const FollowButton();
  }
}
