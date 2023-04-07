import 'dart:convert';

import 'package:covid_tracker/Models/photos_model.dart';
import 'package:covid_tracker/Models/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getPostAPI();
  }

  List<PostsModel> postlist = [];

  Future<List<PostsModel>> getPostAPI() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        postlist.add(PostsModel.fromMap(i));
      }

      return postlist;
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<PhotosModel> photosList = [];
  Future<List<PhotosModel>> getPhotosAPI() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        photosList.add(PhotosModel.fromMap(i));
      }

      return photosList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Covid Tracker'),
        ),
        body: FutureBuilder(
          future: getPhotosAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: photosList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(photosList[index].url.toString()), fit: BoxFit.cover),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
