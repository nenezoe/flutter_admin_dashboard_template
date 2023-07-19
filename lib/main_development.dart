import 'package:admin_dashboard/src/my_app.dart';
import 'package:admin_dashboard/src/utils/helpers/flavors.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

List<CameraDescription>? cameras;

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print('Handling a background message ${message.messageId}');
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCqnUWZww1rcQ1LwBr68S9C0VXLgIqx3-4",
      projectId: "lekota-f04f5",
      messagingSenderId: "5573268127",
      appId: "1:5573268127:web:5b7ec1294b9775b5e0c8aa",
    ),
  );

  // await Firebase.initializeApp();
  // await FirebaseMessaging.instance.getInitialMessage();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (TargetPlatform.windows == defaultTargetPlatform ||
      TargetPlatform.macOS == defaultTargetPlatform ||
      TargetPlatform.linux == defaultTargetPlatform) {
    // setWindowTitle('AdminKit');
    // setWindowMinSize(const Size(480, 360));
    // setWindowMaxSize(Size.infinite);
  }

  cameras = await availableCameras();

  F.appFlavor = Flavors.development;

  // FirebaseApp app = await Firebase.initializeApp();
  // print(app.options);

  runApp(
    const ProviderScope(child: MyApp()),
  );
}
