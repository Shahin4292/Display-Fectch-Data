import 'dart:convert';

import 'package:fetch_data/model/photos_model.dart';
import 'package:fetch_data/res/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class PhotosController extends GetxController {
  List photosList = <PhotosModel>[].obs;

  @override
  onInit() {
    fetchData();
    super.onInit();
  }

  Future<List<PhotosModel>?> fetchData() async {
    final response = await http.get(Uri.parse(AppUrl.baseUrl));
    var data = jsonDecode(response.body.toString());
    for (int i = 0; i < data.length; i++) {
      photosList.add(PhotosModel.fromJson(data[i]));
    }
    return null;
  }
}
