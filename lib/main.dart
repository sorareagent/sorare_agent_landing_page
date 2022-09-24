// the entry point for the server

// server-specific import, exposes [Document]
import 'package:jaspr/server.dart';
import 'package:sorare_agent_landing_page/components/app.dart';

void main() {
  // runs the server and serves the provided component
  // - comes with in hotreload during development when using 'jaspr serve'
  runApp(MyDocument());
}

// root component used to set up the document in 'islands' mode
class MyDocument extends StatelessComponent {
  const MyDocument({Key? key}) : super(key: key);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // scaffolds the main document (<html>, <head>, <body>)
    // and selects the 'islands' mode
    // - only specified **Island** components will be compiled as part of the javascript bundle and
    //   hydrated on the client
    // - all client-side code will be auto-generated inside the /web directory
    yield Document.islands(
      title: 'Sorare Agent',
      styles: [
        StyleRule.import(
          'https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css',
        ),
        StyleRule.import(
          'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css',
        ),
        StyleRule.import('https://fonts.googleapis.com/css2?family=Homenaje'),
        StyleRule(
          selector: const Selector.list([
            Selector.tag('html'),
            Selector.tag('body'),
          ]),
          styles: Styles.raw({
            'background-color':'#373e47',
            'color':'#fafafa',
            'display': 'flex',
            'flex-flow': 'column',
            'justify-content': 'center',
            'align-items': 'center',
            'height': '70%',
            'font-family': 'sans-serif',
          }),
        ),
        StyleRule(
          selector: const Selector.list([
            Selector.tag('body'),
          ]),
          styles: Styles.raw({
            'padding': '16px',
          }),
        ),
      ],
      // renders the [App] component inside the <body>
      body: App(),
    );
  }
}
