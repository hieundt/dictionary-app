import 'package:dictionary/providers/auth_provider.dart';
import 'package:dictionary/providers/dictionary_provider.dart';
import 'package:dictionary/providers/test_provider.dart';
import 'package:dictionary/routes.dart';
import 'package:dictionary/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigator/navigation_sceen.dart';
import 'providers/navigation_bar_provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppNavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DictionaryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TestProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NavigationScreen(),
        routes: appRoutes,
      ),
    );
  }
}
