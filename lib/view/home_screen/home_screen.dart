import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewModel/photos_controller/photos_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  PhotosController photosController = Get.put(PhotosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: photosController.photosList.length,
          itemBuilder: (context, index) {
            return Text(photosController.photosList[index].title.toString());
          }),
    );
  }
}
