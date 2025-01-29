import 'dart:convert';

import 'package:fetch_data/model/photos_model.dart';
import 'package:fetch_data/res/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class PostController extends GetxController {
  var postList = <PostModel>[].obs;
  var isLoading = true.obs;

  @override
  onInit() {
    fetchData();
    super.onInit();
  }

  Future<List<PostModel>?> fetchData() async {
    final response = await http.get(Uri.parse(AppUrl.baseUrl));
    var data = jsonDecode(response.body.toString());
    print(data);
    print(postList);
    if (response.statusCode == 200) {
      for (int i = 0; i < data.length; i++) {
        postList.add(PostModel.fromJson(data[i]));
      }
    }
    return null;
  }
}
