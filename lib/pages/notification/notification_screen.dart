import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Row(
                      children: [
                        Icon(Icons.arrow_back, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          'NEXUS',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.notifications_outlined,
                      color: Colors.black87),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  NotificationItem(
                    avatar: 'assets/avatar1.png',
                    name: 'David John',
                    action: 'Invite Lions Club Tamilnadu',
                    time: 'Just now',
                    hasJoinButton: true,
                  ),
                  NotificationItem(
                    avatar: 'assets/avatar2.png',
                    name: 'Adnan Safi',
                    action: 'Started following you',
                    time: '5 min ago',
                  ),
                  // Add more notification items...
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String avatar;
  final String name;
  final String action;
  final String time;
  final bool hasJoinButton;

  const NotificationItem({
    super.key,
    required this.avatar,
    required this.name,
    required this.action,
    required this.time,
    this.hasJoinButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(avatar),
            radius: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black87),
                    children: [
                      TextSpan(
                        text: name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' $action'),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                if (hasJoinButton) ...[
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Reject'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Join'),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
