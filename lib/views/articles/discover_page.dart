import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/articles/articles_list.dart';
import 'package:news_app/views/articles/categories_list.dart';
import 'package:news_app/widgets/searchbar.dart';

import '../../data/categories_data.dart';
import '../../models/articles.dart';
import '../../models/categories.dart';
import '../../services/api_service.dart';
import '../../utils/colors.dart';
import 'articles_widget.dart';

class Discoverpage extends StatefulWidget {
  const Discoverpage({
    super.key,
  });

  @override
  State<Discoverpage> createState() => DiscoverpageState();
}

class DiscoverpageState extends State<Discoverpage> {
  late List<CategorieModel> categories = <CategorieModel>[];
  late String countryname = "US";
  

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ApiService articles = ApiService("us");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            CountryListPick(
              appBar: AppBar(
                backgroundColor: AppColors.black,
                title: Text(
                  'Choose  a country',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
              pickerBuilder: (context, CountryCode? countryCode) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(
                        countryCode!.flagUri.toString(),
                        package: 'country_list_pick',
                        width: 32.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        countryCode.name.toString(),
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.white,
                    )
                  ],
                );
              },
              theme: CountryTheme(
                labelColor: AppColors.white,
                isShowFlag: true,
                isShowTitle: true,
                isShowCode: false,
                isDownIcon: true,
                showEnglishName: true,
              ),
              initialSelection: 'US',
              onChanged: (CountryCode? code) {
                setState(() {
                  countryname = code!.code.toString();
                });
                debugPrint(code!.code);
              },
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: articles.getArticles("news"),
        builder: (context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
          return SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    "Discover ",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    "News from all over the world",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: AppColors.grey),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  SearchField(
                    size: size,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                              height: 40, child: Catlist(cats: categories))),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    "Variety of articles ",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Articleslist(articles: articles),
                    ],
                  ),
                ],
              ),
            ),
          );
          }
          return const Center(
              child: CircularProgressIndicator(
                color: AppColors.black,
              ),
            );
        }
      ),
    );
  }
}
