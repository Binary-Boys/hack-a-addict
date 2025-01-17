// userhomescreen.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackaddict/communities.dart';
import 'package:hackaddict/pages/chat_module/chatscreen.dart';
import 'package:hackaddict/pages/events_module/events_screen.dart';
import 'package:hackaddict/pages/homescreen/feedsPage.dart';
import 'package:hackaddict/pages/login/welcomescreen.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  int _selectedIndex = 0;

  Future<void> handleSignOut(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return WelcomeScreen();
    }), (ctx) => false);
  }

  final pages = [Feedspage(), EventsScreen(), ChatScreen(), CommunitiesPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF2962FF)),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Row(
          children: [
            Text(
              'NEXUS',
              style: TextStyle(
                color: Color(0xFF2962FF),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE8EAFD),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
              color: Colors.grey[700],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF2962FF),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Eren Yeager',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              icon: Icons.person_outline,
              title: 'My Profile',
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            _buildDrawerItem(
              icon: Icons.warning_outlined,
              title: 'Report Hotspot',
              onTap: () => Navigator.pushNamed(context, '/report'),
            ),
            _buildDrawerItem(
              icon: Icons.calendar_today,
              title: 'Events',
              onTap: () => Navigator.pushNamed(context, '/events'),
            ),
            _buildDrawerItem(
              icon: Icons.bookmark_outline,
              title: 'Saved Post',
              onTap: () => Navigator.pushNamed(context, '/saved'),
            ),
            _buildDrawerItem(
              icon: Icons.help_outline,
              title: 'Rehab Centres',
              onTap: () => Navigator.pushNamed(context, '/rehab'),
            ),
            _buildDrawerItem(
              icon: Icons.timeline,
              title: 'Progress',
              onTap: () => Navigator.pushNamed(context, '/progress'),
            ),
            _buildDrawerItem(
              icon: Icons.favorite_outline,
              title: 'Care',
              onTap: () => Navigator.pushNamed(context, '/care'),
            ),
            _buildDrawerItem(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
            const Divider(),
            _buildDrawerItem(
              icon: Icons.logout,
              title: 'Sign Out',
              onTap: () => handleSignOut(context),
            ),
          ],
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(0, Icons.home, 'Home'),
              _buildNavItem(1, Icons.calendar_today, ''),
              _buildNavItem(2, Icons.chat_outlined, ''), // Changed to chat icon
              _buildNavItem(3, Icons.group, 'CommunitiesPage'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600], size: 24),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2962FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
