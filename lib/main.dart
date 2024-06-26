import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_notepad/Provider/AuthProvider/auth_provider.dart';
import 'package:rest_api_notepad/splash.dart';
import 'package:rest_api_notepad/Styles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: primaryColor),
            primaryColor: primaryColor),
        home: const SplashScreen(),
      ),
    );
  }
}
