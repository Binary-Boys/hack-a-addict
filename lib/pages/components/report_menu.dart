import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackaddict/services.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({Key? key}) : super(key: key);

  Future<bool> isCurrentUserAdmin() async {
    final db = FirebaseFirestore.instance;
    bool isAdmin = false;
    String userID = getCurrentUserID();
    final docRef = await db.collection("users").doc(userID);
    await docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, bool>;
        isAdmin = data["isAdmin"]!;
      },
      onError: (e) {
        print(e);
      },
    );

    return isAdmin;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isCurrentUserAdmin(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while the Future is resolving.
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          // Handle error if the Future fails.
          return const Center(
            child: Text("Error loading user role"),
          );
        } else if (snapshot.hasData) {
          // Render the widget based on the admin status.
          bool isAdmin = snapshot.data!;
          return _buildDrawerItem(
            icon: Icons.warning_outlined,
            title: isAdmin ? 'Report Hotspot' : 'View Hotspot',
            onTap: () {
              Navigator.pushNamed(
                context,
                isAdmin ? '/report' : '/viewreport',
              );
            },
          );
        } else {
          // Fallback UI if there's no data.
          return const SizedBox.shrink();
        }
      },
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
}
