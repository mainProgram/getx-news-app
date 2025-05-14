import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_news_app/views/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final box = GetStorage();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("box: ${box.read("theme")}");

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: box.read("theme") != null ||box.read("theme") == "dark" ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(),
    );
  }
}
