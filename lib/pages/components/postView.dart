import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class PostView extends StatelessWidget {
  final String username, profileImgURL, postImgURL, caption;
  // final List<Map<String, dynamic>> posts;
  const PostView(
      {super.key,
      required this.username,
      required this.profileImgURL,
      required this.postImgURL,
      required this.caption});

  // const PostView({super.key, required this.posts});

  Future<String> getDownloadURL(String filePath) async {
    final ref = FirebaseStorage.instance.ref(filePath);
    return await ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getDownloadURL(profileImgURL),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error loading image: ${snapshot.error}'));
        }
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(30, 10, 21, 53), // Shadow color
                  spreadRadius: 5, // Spread radius
                  blurRadius: 10, // Blur radius
                  offset: Offset(0, 3), // Changes position of shadow (x, y)
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            // color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage(snapshot.data!)),
                    SizedBox(
                      width: 15,
                    ),
                    Text(username)
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  width: 400,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(snapshot.data!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red, size: 20),
                    SizedBox(
                      width: 10,
                    ),
                    Text(caption)
                  ],
                )
              ],
            ),
          );
        }
        return Center(child: Text('No image found'));
      },
    );
  }
}
