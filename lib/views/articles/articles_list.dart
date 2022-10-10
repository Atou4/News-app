import 'package:flutter/material.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/views/articles/articles_widget.dart';

class Articleslist extends StatelessWidget {
  final List<Article>? articles;
  const Articleslist({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: articles!.length,
          itemBuilder: (BuildContext context, int index) {
            final article = articles![index];
            return Articleswidget(
              index: index,
              author: article.author,
              publishedAt: article.publishedAt,
              title: article.title,
              urlToImage: article.urlToImage,
              url: article.url,
            );
          },
        ));
  }
}
