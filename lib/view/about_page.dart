import 'package:about/about.dart' as about;

import 'package:flutter/material.dart';

import '../custom_scaffold_builder.dart' as scaffold;

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return about.AboutPage(
      values: {
        'version': '2.0.0-alpha.2',
        'year': DateTime.now().year.toString(),
      },
      title: Text(
        'About',
        style: TextStyle(
          background: Paint()
            ..color = Theme.of(context).colorScheme.primary.withOpacity(0.5)
            ..strokeWidth = 17
            ..strokeJoin = StrokeJoin.round
            ..strokeCap = StrokeCap.round
            ..style = PaintingStyle.stroke,
        ),
      ),
      scaffoldBuilder: scaffold.customScaffoldBuilder,
      applicationLegalese: 'Copyright © Arttu Ylhävuori, {{ year }}',
      applicationDescription: const Text(
        'A participants lottery and a timer for devs\' daily scrum meetings.',
        textAlign: TextAlign.justify,
      ),
      children: const <Widget>[
        about.MarkdownPageListTile(
          filename: 'README.md',
          title: Text('View Readme'),
          icon: Icon(Icons.all_inclusive),
        ),
        about.MarkdownPageListTile(
          filename: 'LICENSE.md',
          title: Text('View License'),
          icon: Icon(Icons.description),
        ),
        about.LicensesPageListTile(
          title: Text('Open source Licenses'),
          icon: Icon(Icons.favorite),
        ),
      ],
      // applicationIcon: const SizedBox(
      //   width: 100,
      //   height: 100,
      //   child: Image(
      //     image: AssetImage('assets/icon.webp'),
      //   ),
      // ),
    );
  }
}
