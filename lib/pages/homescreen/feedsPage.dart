import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hackaddict/pages/components/postView.dart';
import 'package:image_picker/image_picker.dart';

class Feedspage extends StatefulWidget {
  const Feedspage({super.key});

  @override
  State<Feedspage> createState() => _FeedspageState();
}

class _FeedspageState extends State<Feedspage> {
  final _captionTextController = TextEditingController();
  List<Map<String, dynamic>> posts = [];
  @override
  void initState() {
    fetchPost();
    // posts = fetchPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            //for top spacing
            Container(
              height: 10,
              color: Colors.white,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: posts.length,
                separatorBuilder: (ctx, idx) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemBuilder: (context, index) {
                  //new widget for post display
                  // username: posts[index]["username"],

                  final post = posts[index];
                  print(post["imgURL"]);
                  // print(
                  //     "askdfhklshfsdhjshfkfhskfjaskhsafh66666666666666666666666666666");
                  final User? user = FirebaseAuth.instance.currentUser;

                  return PostView(
                      username: user == null ? "Ashwin" : user.email!,
                      // profileImgURL: "Post-Images/2025-01-19 01:03:44.101677",
                      profileImgURL: post["imgURL"],
                      postImgURL:
                          "gs://react-5a257.appspot.com/Post-Images/2025-01-18 15:54:18.661837",
                      caption: post["caption"]);
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showBottomSheet(context);
            },
            isExtended: true,
            backgroundColor: Color(0xFF2962FF),
            child: Icon(
              Icons.add,
              color: Colors.white,
            )));
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 700,
        context: context,
        builder: (ctx1) {
          return Padding(
            padding: EdgeInsets.all(20),
            // width: 400,
            // color: Colors.white,
            // height: 1000,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Post',
                      style: TextStyle(color: Color(0xFF2563EB), fontSize: 20),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx1).pop();
                          image = null;
                          _captionTextController.text = '';
                        },
                        child: Icon(Icons.close)),
                  ],
                ),
                Center(
                    child: image == null
                        ? ElevatedButton(
                            style: ButtonStyle(
                                // backgroundColor: Colors.blue
                                ),
                            onPressed: () {
                              _pickImageFromGallery();
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.photo_library,
                                  color: Colors.black,
                                ),
                                Text("Select an Image")
                              ],
                            ))
                        : Container(
                            width: 300,
                            height: 300,
                            child: Image.file(
                              image!,
                              scale: 0.7,
                            ))),
                TextFormField(
                  controller: _captionTextController,
                  decoration: InputDecoration(hintText: "Caption"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          Navigator.of(ctx1).pop();
                          await uploadPost(image!);
                          image = null;
                          _captionTextController.text = '';
                        },
                        child: Text(
                          "Post",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2563EB))),
                  ],
                )
              ],
            ),
          );
        });
  }

  File? image;
  Future<void> _pickImageFromGallery() async {
    final pickerFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(pickerFile!.path);
    });
  }

  Future<void> uploadPost(File file) async {
    try {
      // upload image
      final filename = DateTime.now().toString();
      final postImgRef =
          FirebaseStorage.instance.ref('Post-Images').child(filename);

      final postImgSnapShot = await postImgRef.putFile(file);
      final imgURL = await postImgSnapShot.ref.getDownloadURL();

      //update the post in DB
      await FirebaseFirestore.instance.collection("posts").add({
        "caption": _captionTextController.text.trim(),
        "imgURL": 'Post-Images/$filename',
        "likes": ['hlasdf', 'asdfds'],
        "postTime": FieldValue.serverTimestamp(),
        "userID": FirebaseAuth.instance.currentUser?.uid
      });
      await fetchPost();
      print("posted");
    } catch (e) {
      print("^^^^^^$e");
    }
  }

  Future<void> fetchPost() async {
    final db = await FirebaseFirestore.instance;

    try {
      final querySnapshot = await db.collection("posts").get();
      final fetchedPosts = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      setState(() {
        posts = fetchedPosts;
      });

      // print(posts[0]["userID"]);
    } on FirebaseException catch (e) {
      // Handle any errors.
      print(e.message);
    }
    // return [];
  }
}
