
import 'package:flutter/material.dart';
import 'package:news_app/models/categories.dart';

import 'category_widget.dart';
class Catlist extends StatelessWidget {
  final List<CategorieModel> cats;
  const Catlist({Key? key, required this.cats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cats.length,
        itemBuilder: (BuildContext context, int index) {
              final cat = cats[index];
              return Categorytab(title: cat.categorieName,)  ;
            },
      )
    );
  }
}