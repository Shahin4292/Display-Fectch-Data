import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewModel/photos_controller/post_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Fetch API Data'),
        ),
        body: Obx(() {
          return ListView.builder(
              itemCount: postController.postList.length,
              itemBuilder: (context, index) {
                final postData = postController.postList[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          postData.title.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          postData.body.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }));
  }
}
