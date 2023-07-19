import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension Path on String {
  bool isActive(BuildContext context) {
    if (context.router.currentPath.split('/').last == 'ingrid' &&
        this == 'Dashboard') {
      return true;
    }
    return context.router.currentPath.split('/').last == toLowerCase();
  }

  String get _capitalizeFirst =>
      this[0].toUpperCase() + substring(1).toLowerCase();

  String get capitalize =>
      trim().split(' ').map((e) => e.trim()._capitalizeFirst).join(' ');
  
  String get route =>
      trim().split('-').map((e) => e.trim()._capitalizeFirst).join(' ');
}

extension Context on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// similar to [Theme.of(context)]
  ThemeData get theme => Theme.of(this);

  /// similar to [Theme.of(context).colorScheme]
  ColorScheme get color => Theme.of(this).colorScheme;

  /// The same of [MediaQuery.of(context).size]
  Size get size => MediaQuery.of(this).size;

  /// The same of [MediaQuery.of(context).size.height]
  double get height => MediaQuery.of(this).size.height;

  /// The same of [MediaQuery.of(context).size.width]
  double get width => MediaQuery.of(this).size.width;
}
