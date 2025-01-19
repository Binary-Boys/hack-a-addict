import 'package:flutter/material.dart';

class CommunitiesPage extends StatelessWidget {
  final List<Community> topCommunities = [
    Community(
      name: 'Kerala Drug fighters',
      icon: 'assets/images/kerala_drug_fighters.png',
      onTap: () => navigateToCommunityHome(),
    ),
    Community(
      name: 'Vimukthi Excise Kerala',
      icon: 'assets/images/vimukthi.png',
      onTap: () => navigateToCommunityHome(),
    ),
    Community(
      name: 'Lions club Trivandrum',
      icon: 'assets/images/lions_club.png',
      onTap: () => navigateToCommunityHome(),
    ),
    Community(
      name: 'Red Cross kerala',
      icon: 'assets/images/red_cross.png',
      onTap: () => navigateToCommunityHome(),
    ),
  ];

  CommunitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Communities',
          style: TextStyle(color: Color(0xFF2563EB)),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All communities',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Filters',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topCommunities.length,
                itemBuilder: (context, index) {
                  return CommunityCard(community: topCommunities[index]);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        Tab(text: 'Updates'),
                        Tab(text: 'My communities'),
                      ],
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 500, // Adjust based on content
                      child: TabBarView(
                        children: [
                          UpdatesTab(),
                          MyCommunititesTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void navigateToCommunityHome() {
    // Implement navigation to CommunityHome
  }
}

class Community {
  final String name;
  final String icon;
  final VoidCallback onTap;

  Community({
    required this.name,
    required this.icon,
    required this.onTap,
  });
}

class CommunityCard extends StatelessWidget {
  final Community community;

  const CommunityCard({super.key, required this.community});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: community.onTap,
      child: Container(
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(community.icon),
            ),
            SizedBox(height: 8),
            Text(
              community.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class UpdatesTab extends StatelessWidget {
  const UpdatesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CreatePostCard(),
        CommunityPost(
          communityName: 'Vimukthi Excise Kerala',
          authorName: 'Sri. MAHIPAL YADAV IPS2',
          authorTitle: 'Excise Commissioner',
          content: 'On this Drug Day, let us renew our commitment to '
              'combating the menace of drug abuse. '
              'Drug abuse not only destroys individuals and '
              'families but also has a devastating impact on our society.',
          likes: 16,
          comments: 24,
        ),
        // Add more posts as needed
      ],
    );
  }
}

class CreatePostCard extends StatelessWidget {
  const CreatePostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/profile4.png'),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Write your post here',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text('Add your post in'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Post', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityPost extends StatelessWidget {
  final String communityName;
  final String authorName;
  final String authorTitle;
  final String content;
  final int likes;
  final int comments;

  const CommunityPost({
    super.key,
    required this.communityName,
    required this.authorName,
    required this.authorTitle,
    required this.content,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Posted in $communityName',
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authorName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      authorTitle,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(content),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.blue),
                SizedBox(width: 4),
                Text('$likes'),
                SizedBox(width: 16),
                Icon(Icons.comment, color: Colors.grey),
                SizedBox(width: 4),
                Text('$comments'),
                Spacer(),
                Icon(Icons.share, color: Colors.grey),
                SizedBox(width: 4),
                Text('Share'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyCommunititesTab extends StatelessWidget {
  const MyCommunititesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Communities Content'),
    );
  }
}
