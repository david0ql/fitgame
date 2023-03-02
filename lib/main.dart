import 'package:fitgame/src/providers/bottom_service.dart';
import 'package:fitgame/src/routes/router.dart';
import 'package:fitgame/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomService>(
          create: (context) => BottomService(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitgame',
      initialRoute: 'splash',
      routes: MyRouter.routes,
      theme: MyTheme.myTheme,
    );
  }
}
