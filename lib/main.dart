import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackaddict/firebase_options.dart';
import 'package:hackaddict/pages/Profile/profile.dart';
import 'package:hackaddict/pages/events_module/events_screen.dart';
import 'package:hackaddict/pages/homescreen/userhomescreen.dart';
import 'package:hackaddict/pages/login/welcomescreen.dart';
import 'package:hackaddict/pages/progress_tracker/progress_screen.dart';
import 'package:hackaddict/pages/report_screen/reportscreen.dart';
import 'package:hackaddict/pages/saved_posts/saved_posts.dart';
import 'package:hackaddict/settings_page/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
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
        '/saved': (context) => const SavedPostsScreen(),
        // '/rehab': (context) => const RehabScreen(),
        '/progress': (context) => const ProgressScreen(),
        // '/care': (context) => const CareScreen(),
        '/settings': (context) => const SettingsPage(),
        // ... existing routes
      },
      // home: const WelcomeScreen(),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapsot) {
            if (snapsot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapsot.data != null) {

              return UserHomeScreen();
            }
            return const WelcomeScreen();
          }),
    );
  }
}
