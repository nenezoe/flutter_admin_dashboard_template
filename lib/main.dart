import 'package:admin_dashboard/src/my_app.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

import 'package:window_size/window_size.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (TargetPlatform.windows == defaultTargetPlatform ||
      TargetPlatform.macOS == defaultTargetPlatform ||
      TargetPlatform.linux == defaultTargetPlatform) {
    setWindowTitle('AdminKit');
    setWindowMinSize(const Size(480, 360));
    setWindowMaxSize(Size.infinite);
  }
  setPathUrlStrategy();
  await languageModel.load();
  runApp(const MyApp());
}
