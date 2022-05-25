import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(
    BuildContext context, Widget title, List<Widget>? actions) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    title: title,
    centerTitle: true,
    actions: actions,
  );
}
