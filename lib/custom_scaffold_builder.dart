/*
 * This scaffold builder is based on the work of (from about-2.1.1):
 * Copyright (C) 2020, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * Edited by Arttu Ylhävuori 2022.
 */

import 'package:flutter/material.dart';

typedef ScaffoldBuilder = Widget Function(
  BuildContext context,
  Widget title,
  Widget child,
);

Widget customScaffoldBuilder(BuildContext context, Widget title, Widget child) {
  return Scaffold(
    appBar: AppBar(
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
    ),
    body: child,
  );
}
