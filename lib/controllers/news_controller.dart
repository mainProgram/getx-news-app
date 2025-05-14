import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/news_model.dart';
import 'api_helper.dart';

class NewsController extends GetxController {

  final box = GetStorage();
  NewsHelper newsHelper = NewsHelper();

  @override
  void onInit() {
    super.onInit();
    getHeadlines();
  }

  void changeThemeMode() {
    String? theme = box.read("theme");
    if(theme == "dark" || theme == null) {
      Get.changeThemeMode(ThemeMode.light);
      box.write("theme", "light");
    }
    else{
      Get.changeThemeMode(ThemeMode.dark);
      box.write("theme", "dark");
    }
    update();
  }

  IconData getIcon() {
    String? theme = box.read("theme");
    return (theme == "dark") ?  Icons.dark_mode : Icons.light_mode;
  }

  int index = 0;
  void changeNavbar({required int i}) {
    index = i;
    debugPrint("index: $index");
    update();
  }

  List<News> list = [];
  void getHeadlines() async {
    list = await newsHelper.getHeadlines();
    update();
  }

  List<News> categoryList = [];
  Future<List<News>> getNewsCategory({required String category}) async {
    print(category);
    categoryList = await newsHelper.getNewsCategory(category: category);
    update();
    return categoryList;
  }
}