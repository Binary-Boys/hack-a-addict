import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      body: SafeArea(
        child: Column(
          children: [
            // Back button and curved background
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      // Profile Section
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            // Profile Image
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey.shade200,
                                  child: ClipOval(
                                    child: Image.network(
                                      'assets/images/profile4.png',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.grey.shade200),
                                    ),
                                    child: Icon(Icons.edit,
                                        size: 20, color: Colors.grey.shade600),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Eren Yeager',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'eren@something.com | +91 123 456 789',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Settings Sections
                      _buildSettingsSection(
                        [
                          _buildSettingsTile(
                            icon: Icons.edit_note,
                            title: 'Edit profile information',
                            onTap: () {},
                          ),
                          _buildSettingsTile(
                            icon: Icons.notifications_outlined,
                            title: 'Notifications',
                            trailing: Switch(
                              value: true,
                              onChanged: (value) {},
                              activeColor: Colors.blue,
                            ),
                          ),
                          _buildSettingsTile(
                            icon: Icons.translate,
                            title: 'Language',
                            trailing: const Text('English',
                                style: TextStyle(color: Colors.blue)),
                            onTap: () {},
                          ),
                        ],
                      ),

                      _buildSettingsSection(
                        [
                          _buildSettingsTile(
                            icon: Icons.security,
                            title: 'Security',
                            onTap: () {},
                          ),
                          _buildSettingsTile(
                            icon: Icons.brightness_6_outlined,
                            title: 'Theme',
                            trailing: const Text('Light mode',
                                style: TextStyle(color: Colors.blue)),
                            onTap: () {},
                          ),
                        ],
                      ),

                      _buildSettingsSection(
                        [
                          _buildSettingsTile(
                            icon: Icons.help_outline,
                            title: 'Help & Support',
                            onTap: () {},
                          ),
                          _buildSettingsTile(
                            icon: Icons.chat_bubble_outline,
                            title: 'Contact us',
                            onTap: () {},
                          ),
                          _buildSettingsTile(
                            icon: Icons.lock_outline,
                            title: 'Privacy policy',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(List<Widget> tiles) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(children: tiles),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey.shade600),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
