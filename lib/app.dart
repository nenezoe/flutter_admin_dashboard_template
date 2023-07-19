// import 'package:admin_dashboard/src/routes/routes.dart';
// import 'package:admin_dashboard/src/utils/helpers/flavors.dart';
// import 'package:bot_toast/bot_toast.dart';
// import 'package:flex_color_scheme/flex_color_scheme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:lekota_users_dashboard/src/routes/app_route.dart';
// import 'package:lekota_users_dashboard/src/utils/helpers/flavors.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// final supabase = Supabase.instance.client;

// class App extends ConsumerStatefulWidget {
//   const App({super.key});
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
// }

// class _AppState extends ConsumerState<App> {
//   void _supabaseSetUp() async {
//     await Supabase.initialize(
//       url: F.getSupabaseSetUpKeys!.supabaseUrl,
//       anonKey: F.getSupabaseSetUpKeys!.supabaseAnonKey,
//     );
//   }

//   void _initHive() async {
//     await Hive.initFlutter();
//     // _loadTheme();
//   }

//   @override
//   void initState() {
//     _supabaseSetUp();
//     _initHive(); // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routeInformationParser: AppRouter.router.routeInformationParser,
//       routerDelegate: AppRouter.router.routerDelegate,
//       routeInformationProvider: AppRouter.router.routeInformationProvider,
//       debugShowCheckedModeBanner: false,
//       title: F.title,
//       builder: BotToastInit(),
//       theme: FlexThemeData.light(
//         scheme: FlexScheme.flutterDash,

//         textTheme: GoogleFonts.kanitTextTheme(),

//         // dialogBackground: LekotaColor.primary,
//       ),
//       darkTheme: FlexThemeData.dark(
//         scheme: FlexScheme.flutterDash,

//         textTheme: GoogleFonts.kanitTextTheme(),

//         // dialogBackground: Color(0xff081e2b),
//       ),
//       // themeMode: ref.watch(themeModeProvider),
//     );
//   }
// }
