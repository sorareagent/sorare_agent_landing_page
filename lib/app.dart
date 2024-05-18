import 'package:jaspr/jaspr.dart';
import 'package:sorare_agent_landing_page/pages/sorare_agent.dart';

// A simple [StatelessComponent] with a [build] method.
class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield const SorareAgent();
  }
}
