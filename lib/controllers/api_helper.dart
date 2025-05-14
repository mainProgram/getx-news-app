import 'package:get/get.dart';
import 'package:getx_news_app/models/news_model.dart';

class NewsHelper extends GetConnect implements GetxService {

  Future<List<News>> getHeadlines() async {
    Response response = await get("https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=96b59f80aa2e406e8ae8f2ee35775eea");
    print(response.body["articles"]);
    print(response.body);
    List data = response.body["articles"];
    List<News> news = data.map((e) => News.fromJson(e)).toList();
    print(news);
    return news;
  }

  Future<List<News>> getNewsCategory({required String category}) async {
    Response response = await get("https://newsapi.org/v2/top-headlines?country=us&category=${category}&apiKey=96b59f80aa2e406e8ae8f2ee35775eea");
    List data = response.body["articles"];
    List<News> news = data.map((e) => News.fromJson(e)).toList();
    print(news);
    return news;
  }
}