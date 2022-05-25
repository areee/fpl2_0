import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

Widget customScaffoldBuilder(BuildContext context, Widget title, Widget child) {
  return Scaffold(
    appBar: customAppBar(context, title, null),
    body: child,
  );
}
