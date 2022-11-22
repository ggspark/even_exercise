import 'package:even_exercise/constants.dart';
import 'package:even_exercise/screens/history_screen.dart';
import 'package:even_exercise/screens/service_select_screen.dart';
import 'package:even_exercise/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Even',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Dashboard(),
        '/service': (context) => const ServiceSelectScreen()
      },
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(lightBackgroundColor),
      bottomNavigationBar:
          BottomNavBar(currentIndex: (int index) => {print(index)}),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: <Color>[
              Color(lightBackgroundColor),
              Color(darkBackgroundColor),
            ],
            tileMode: TileMode.clamp,
          ),
        ),
        child: const HistoryScreen(),
      ),
    );
  }
}
