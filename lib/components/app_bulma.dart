import 'package:jaspr/jaspr.dart' hide Color;
import 'package:sorare_agent_landing_page/components/bulma/button.dart';
import 'package:sorare_agent_landing_page/components/bulma/colors.dart';
import 'package:sorare_agent_landing_page/components/bulma/navbar.dart';
import 'package:sorare_agent_landing_page/components/bulma/progress_bar.dart';
import 'package:sorare_agent_landing_page/components/bulma/tabs.dart';

void main() {
  runApp(AppBulma());
}

class AppBulma extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield NavBar(
      brand: NavbarBrand(children: [
        NavbarItem(child: BulmaLogo(), href: 'https://bulma.io'),
      ]),
      menu: NavbarMenu(items: [
        NavbarItem(child: Text('Home')),
        NavbarItem(child: Text('Documentation')),
        NavbarItem.dropdown(child: Text('More'), items: [
          NavbarItem(child: Text('About')),
          NavbarItem(child: Text('Jobs')),
          NavbarItem(child: Text('Contact')),
          NavbarDivider(),
          NavbarItem(child: Text('Report an issue')),
        ]),
      ]),
    );

    yield ButtonGroup(children: [
      Button(child: Text('Normal'), onPressed: () {}),
      Button(child: Text('Outlined'), isOutlined: true, onPressed: () {}),
      Button(child: Text('Primary'), color: Color.primary, onPressed: () {}),
      Button(child: Text('Loading'), isLoading: true, onPressed: () {}),
    ]);

    yield ButtonGroup(isAttached: true, children: [
      Button(child: IconLabel(icon: 'align-left', label: 'Left'), onPressed: () {}),
      Button(child: IconLabel(icon: 'align-center', label: 'Center'), onPressed: () {}),
      Button(child: IconLabel(icon: 'align-right', label: 'Right'), onPressed: () {}),
    ]);

    yield ProgressBar(value: 70, color: Color.success);
    yield ProgressBar(color: Color.warning);

    yield Tabs(
      tabs: [Text('Pictures'), Text('Music'), Text('Videos'), Text('Documents')],
      onSelected: (int value) {},
    );

    yield Tabs(
      tabs: [
        IconLabel(icon: 'image', label: 'Pictures'),
        IconLabel(icon: 'music', label: 'Music'),
        IconLabel(icon: 'film', label: 'Videos'),
        IconLabel(icon: 'file-alt', label: 'Documents'),
      ],
      isToggle: true,
      onSelected: (int value) {},
    );
  }
}

class BulmaLogo extends StatelessComponent {
  const BulmaLogo({Key? key}) : super(key: key);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'img',
      attributes: {'src': 'https://bulma.io/images/bulma-logo.png', 'width': '112', 'height': '20'},
    );
  }
}

