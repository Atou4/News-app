import 'package:flutter/material.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/views/Headlines/headline_widget.dart';

class HeadlinesList extends StatelessWidget {
  List<Article> headlines;
  HeadlinesList({Key? key, required this.headlines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: headlines.length,
        itemBuilder: (BuildContext context, int index) {
          final headline = headlines[index];
          return HeadlineWidget(
            index: index,
            author: headline.author,
            publishedAt: headline.publishedAt,
            title: headline.title,
            urlToImage: headline.urlToImage,
          );
        },
      ),
    );
  }
}
