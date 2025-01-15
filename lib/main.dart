import 'package:flutter/material.dart';
import 'package:hackaddict/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nexus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
  '/profile': (context) => const ProfileScreen(),
  '/report': (context) => const ReportScreen(),
  '/events': (context) => const EventsScreen(),
  '/saved': (context) => const SavedScreen(),
  '/rehab': (context) => const RehabScreen(),
  '/progress': (context) => const ProgressScreen(),
  '/care': (context) => const CareScreen(),
  '/settings': (context) => const SettingsScreen(),
  // ... existing routes
}
      home: const WelcomeScreen(),
    );
  }
}
