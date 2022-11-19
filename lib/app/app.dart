import 'package:flutter/material.dart';
import 'package:news_app/utils/theme.dart';
import 'package:news_app/views/bottom_nav.dart';

enum Env {
  dev('dev.api.mysite.com'),
  prod('prod.api.mysite.com');

  const Env(this.host);

  final String host;
}

class App extends StatefulWidget {
  const App({
    Key? key,
    required this.env,
  }) : super(key: key);

  final Env env;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe app',
      theme: Apptheme.lightTheme,
      home: const MainScreen(),
    );
  }
}
