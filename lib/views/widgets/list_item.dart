import 'package:flutter/material.dart';
import 'package:getx_news_app/models/news_model.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.list}) : super(key: key);

  final List<News> list ;

  @override
  Widget build(BuildContext context) {
    if(list.isNotEmpty) {
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage('${list[index].urlToImage}'),
                        fit: BoxFit.cover
                    )
                ),
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "${list[index].title}",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                        color: Colors.white
                    ),),
                ),
              ),
            );
          }
      );
    }
    else {
      return const Center(child: CircularProgressIndicator(),);
    }
  }
}