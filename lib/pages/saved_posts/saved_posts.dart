import 'package:flutter/material.dart';

class SavedPostsScreen extends StatefulWidget {
  const SavedPostsScreen({super.key});

  @override
  State<SavedPostsScreen> createState() => _SavedPostsScreenState();
}

class _SavedPostsScreenState extends State<SavedPostsScreen> {
  final List<SavedPost> savedPosts = [
    SavedPost(
      username: 'Erin Yeager',
      userRole: 'CEA Student',
      imageUrl: 'assets/images/event2.png',
      title: 'Webie',
      subtitle: 'Your software solutions',
      likes: 50000,
      comments: 38000,
      isSaved: true,
      features: [
        '100+ project ideas',
        'Custom projects',
        'Mini & Major projects',
        'Project reports & PPT'
      ],
    ),
    SavedPost(
      username: 'Alex Johnson',
      userRole: 'UI Designer',
      imageUrl: 'assets/images/event1.jpeg',
      title: 'Design Hub',
      subtitle: 'Creative design solutions',
      likes: 35000,
      comments: 22000,
      isSaved: true,
      features: [
        'UI/UX Templates',
        'Design Resources',
        'Portfolio Projects',
        'Case Studies'
      ],
    ),
    // Add more sample posts here
  ];

  void toggleSave(int index) {
    setState(() {
      savedPosts[index].isSaved = !savedPosts[index].isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'NEXUS',
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Saved post',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: savedPosts.length,
                itemBuilder: (context, index) {
                  return SavedPostCard(
                    post: savedPosts[index],
                    onSaveToggle: () => toggleSave(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SavedPost {
  final String username;
  final String userRole;
  final String imageUrl;
  final String title;
  final String subtitle;
  final int likes;
  final int comments;
  bool isSaved;
  final List<String> features;

  SavedPost({
    required this.username,
    required this.userRole,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.likes,
    required this.comments,
    required this.isSaved,
    required this.features,
  });
}

class SavedPostCard extends StatelessWidget {
  final SavedPost post;
  final VoidCallback onSaveToggle;

  const SavedPostCard({
    super.key,
    required this.post,
    required this.onSaveToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(post.imageUrl),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      post.userRole,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(post.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        post.subtitle,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: post.features.map((feature) {
                    return Chip(
                      label: Text(feature),
                      backgroundColor: Colors.grey[200],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red[400], size: 20),
                    const SizedBox(width: 4),
                    Text(
                      '${(post.likes / 1000).toStringAsFixed(0)}k',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.chat_bubble_outline,
                        color: Colors.grey, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      '${(post.comments / 1000).toStringAsFixed(0)}k',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        post.isSaved ? Icons.bookmark : Icons.bookmark_border,
                        color: Colors.grey,
                      ),
                      onPressed: onSaveToggle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
