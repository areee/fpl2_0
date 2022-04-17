import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(
    BuildContext context, Widget title, List<Widget>? actions) {
  return AppBar(
    title: title,
    centerTitle: true,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          repeat: ImageRepeat.repeatX,
          image: AssetImage('assets/images/lumihiutale.png'),
        ),
      ),
    ),
    actions: actions,
  );
}