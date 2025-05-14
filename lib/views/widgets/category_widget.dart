import 'package:flutter/material.dart';
import 'package:getx_news_app/shared/constant.dart';
import 'package:getx_news_app/views/widgets/list_item.dart';
import 'package:get/get.dart';
import '../../controllers/news_controller.dart';
import '../../models/news_model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> with SingleTickerProviderStateMixin{
  late TabController? controller;
  final newsController = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    controller = TabController(
        length: CategoryList.categoryItems.length,
        vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: TabBar(
            isScrollable: true,
            controller: controller,
            tabAlignment: TabAlignment.center,
            tabs: CategoryList.categoryItems.map((e) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2), // Padding interne
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  // decoration: BoxDecoration(
                  //   border: Border(
                  //     bottom: BorderSide(
                  //       color: Colors.black,
                  //       width: 2
                  //     ),
                  //     top: BorderSide(
                  //         color: Colors.black,
                  //         width: 2
                  //     ),
                  //     right: BorderSide(
                  //       color: Colors.black,
                  //       width: 2
                  //   ),
                  //     left: BorderSide(
                  //         color: Colors.black,
                  //         width: 2
                  //     ),
                  //   )
                  // ),
                  child: Text(e),
                );
              }
            ).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
              controller: controller,
              children: CategoryList.categoryItems.map((e){
                return FutureBuilder(
                    future: newsController.getNewsCategory(category: e.toLowerCase()),
                    builder: (context, snapshot) {
                      print(e);
                      print(snapshot.hasData);
                      if(snapshot.hasData) {
                        return ListItem(list: snapshot.data as List<News>,);
                      }else {
                        return const Center(child: CircularProgressIndicator(),);
                      }
                    }
                );
              }).toList()
          ),
        )
      ],
    );
  }
}