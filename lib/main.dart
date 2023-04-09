import 'package:covid_tracker/screens/countries_stats_screen.dart';
import 'package:covid_tracker/screens/splash_screen.dart';
import 'package:covid_tracker/screens/world_stats_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Track Together',
      theme: ThemeData(),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        WorldStatsScreen.routeName: (context) => const WorldStatsScreen(),
        CountriesListScreen.routeName: (context) => const CountriesListScreen(),
      },
    );
  }
}
