import 'package:flutter/material.dart';

class Feedspage extends StatefulWidget {
  const Feedspage({super.key});

  @override
  State<Feedspage> createState() => _FeedspageState();
}

class _FeedspageState extends State<Feedspage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for community...',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5, // Increased number of posts
              itemBuilder: (context, index) {
                final users = [
                  {'name': 'Erin Yeager', 'title': 'Webie'},
                  {'name': 'Manas G', 'title': 'Wildlife'},
                  {'name': 'Alex Chen', 'title': 'Technology'},
                  {'name': 'Sarah Kim', 'title': 'Design'},
                  {'name': 'John Doe', 'title': 'Architecture'},
                ];
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),
                      title: Text(
                        users[index]['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'CEA Student',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/post_${index + 1}.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                const Icon(Icons.favorite,
                                    color: Colors.red, size: 20),
                                Text(' ${50 - index}k'),
                                const SizedBox(width: 16),
                                Image.asset('assets/comment_icon.png',
                                    height: 20),
                                Text(' ${38 - index}k'),
                                const SizedBox(width: 16),
                                const Icon(Icons.share,
                                    color: Colors.grey, size: 20),
                                const Spacer(),
                                const Icon(Icons.bookmark_border,
                                    color: Colors.grey, size: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}