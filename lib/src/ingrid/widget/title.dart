import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RouteTitle extends StatelessWidget {
  const RouteTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.router.currentPath.split('/').last.route,
      style: TextStyle(
        fontSize: 24.0,
        color: context.isDarkMode ? Colors.white : ConstColor.lightTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
