import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/views/widgets/category_widget.dart';
import '../../controllers/news_controller.dart';
import '../widgets/home_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final newsController = Get.put(NewsController());
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Get.dialog(
          AlertDialog(
            title: Text('Are you sure?', style: Theme.of(context).textTheme.titleMedium,),
            content: const Text('Do you want to exit the app?'),
            actions: [
              ElevatedButton(
                child: const Text('No'),
                onPressed: () => Get.back(result: false),
              ),
              ElevatedButton(
                child: const Text('Yes'),
                onPressed: () {
                  Get.back(result: true);
                },
              ),
            ],),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: (){
                newsController.changeThemeMode();
              },
              icon: GetBuilder<NewsController>(
                builder: (controller) => Icon(controller.getIcon()),
              ),
            )
          ],
        ),
        body: PageView(
          onPageChanged: (index){
            newsController.changeNavbar(i: index);
            // pageController.jumpToPage(index);
          },
          controller: pageController,
          children: [
            HomeWidget(),
            CategoryWidget(),
          ],
        ),
        bottomNavigationBar: GetBuilder<NewsController>(
          builder: (controller){
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.index ?? 0,
              onTap: (index) {
                print(index);
                controller.changeNavbar(i: index);
                pageController.jumpToPage(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_max_outlined),
                  label: 'Home',
                  activeIcon: Icon(Icons.home),
                  tooltip: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined),
                  label: 'Category',
                  activeIcon: Icon(Icons.category),
                  tooltip: "Category",
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
