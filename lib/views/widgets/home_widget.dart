import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/controllers/news_controller.dart';
import 'package:getx_news_app/views/widgets/list_item.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      init: NewsController(),
      builder: (controller) {
        return ListItem(list: controller.list,);
      }
    );
  }
}