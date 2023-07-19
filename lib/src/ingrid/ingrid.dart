import 'package:admin_dashboard/src/ingrid/constant/const.dart';
import 'package:admin_dashboard/src/ingrid/view/menu_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'constant/theme.dart';

@RoutePage()
class Ingrid extends StatefulWidget {
  const Ingrid({super.key});

  @override
  State<Ingrid> createState() => _IngridState();
}

class _IngridState extends State<Ingrid> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeMode,
      builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: value ? ConstTheme.dark : ConstTheme.light,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.trackpad,
            PointerDeviceKind.unknown
          },
        ),
        title: 'AdminKit',
        home: const SideBar(),
      ),
    );
  }
}
