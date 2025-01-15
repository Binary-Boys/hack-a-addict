// reports_list_screen.dart
import 'package:flutter/material.dart';

class ReportsListScreen extends StatelessWidget {
  const ReportsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reports = [
      {'location': 'Adoor', 'time': 'Just now'},
      {'location': 'Adoor', 'time': 'Just now'},
      {'location': 'Pathanamthitta', 'time': '1hr ago'},
      {'location': 'Pathanamthitta', 'time': '1hr ago'},
      {'location': 'Trivandrum', 'time': '4hr ago'},
      {'location': 'Trivandrum', 'time': '4hr ago'},
      {'location': 'Eranakulam', 'time': '6hr ago'},
      {'location': 'Eranakulam', 'time': '6hr ago'},
      {'location': 'Adoor', 'time': '8hr ago'},
      {'location': 'Adoor', 'time': '8hr ago'},
      {'location': 'Idukki', 'time': '11hr ago'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.notifications_outlined),
                const SizedBox(width: 8),
                const Text(
                  'Reports',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 32),
          Expanded(
            child: ListView.separated(
              itemCount: reports.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final report = reports[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'New Hotspot reported at ${report['location']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Implement show functionality
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2962FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Show'),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '${report['time']}',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}