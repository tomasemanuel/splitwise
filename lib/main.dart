import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitwise/routes/app_routes.dart';
import 'package:splitwise/themes/app_theme.dart';
import 'package:splitwise/providers/providers.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // WidgetsFlutterBinding.ensureInitialized();
  // await Preferences.init();

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
        ChangeNotifierProvider(create: (_) => IndexProvider()),
      ],
      child: const MyApp(),
    );
    ;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FiuFit',
      initialRoute: "home_page",
      routes: AppRoutes.routes,
    );
  }
}
