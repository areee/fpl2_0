import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(
    BuildContext context, Widget title, List<Widget>? actions) {
  return AppBar(
    title: title,
    centerTitle: true,
    actions: actions,
  );
}
