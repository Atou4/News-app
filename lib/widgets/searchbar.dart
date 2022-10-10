import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/articles/articles_list.dart';
import 'package:news_app/views/articles/discover_page.dart';
import 'package:news_app/views/bottom_nav.dart';

import '../models/articles.dart';
import '../services/api_service.dart';
import '../utils/colors.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height / 12,
      width: widget.size.width,
      child: FocusScope(
        child: Focus(
          onFocusChange: (focus) => showSearch(
            context: context,
            delegate: MySearchdelegate(),
          ),
          child: TextField(
            style: Theme.of(context).textTheme.subtitle1,
            maxLines: 1,
            cursorColor: const Color(0xFF151624),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.grey,
                ),
              ),
              hintText: "Search news,articles",
              hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: AppColors.grey,
                  ),
              filled: true,
              fillColor: AppColors.white,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: AppColors.grey,
                  )),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: AppColors.grey,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MySearchdelegate extends SearchDelegate {
  ApiService articles = ApiService("us");
  String keyword="key";
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme;
  }

  @override
  // ignore: body_might_complete_normally_nullable
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
        }
      },
      icon: const Icon(CupertinoIcons.clear),
      color: AppColors.black,
    );
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const BottomNav()));
        },
        icon: const Icon(CupertinoIcons.chevron_back),
        color: AppColors.black,
      );

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: FutureBuilder(
        future: articles.getArticles(query),
        builder: (context, snapshot) {
            List<Article>? articles = snapshot.data;
          if (!snapshot.hasData) {
            return const Center(
              child:  CircularProgressIndicator(
                backgroundColor: AppColors.black,
              ),
            );
          }
          return Articleslist(articles: articles);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: FutureBuilder(
        future: articles.getArticles("keyword"),
        builder: (context, AsyncSnapshot<List<Article>> snapshot) {
            List<Article>? articles = snapshot.data;
          if (!snapshot.hasData) {
            return const Center(
              child:  CircularProgressIndicator(
                backgroundColor: AppColors.black,
              ),
            );
          }
          return Articleslist(articles: articles);
        },
      ),
    );
  }
}