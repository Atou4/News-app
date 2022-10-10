import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/services/api_service.dart';
import 'package:news_app/views/Headlines/headlines_list.dart';

import '../../utils/colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late String countryname = "US";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ApiService headlines = ApiService(countryname);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 100,
        centerTitle: false,
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
            /*Text(
              "America",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),
            IconButton(
              icon: const Icon(CupertinoIcons.chevron_down),
              color: AppColors.white,
              iconSize: 20,
              onPressed: () {},
            ),*/
          ],
        ),
      ),
      body: FutureBuilder(
          future: headlines.getHeadlines(),
          builder: (context, AsyncSnapshot<List<Article>> snapshot) {
            List<Article>? headlines = snapshot.data;
            if (snapshot.hasData) {
              return SingleChildScrollView(
                clipBehavior: Clip.none,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          child: CachedNetworkImage(
                            imageUrl: headlines![0].urlToImage.toString(),
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.black,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.fill,
                            height: size.height / 2.25,
                            width: size.width,
                          ),
                        ),
                        Container(
                          height: size.height / 2.25,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.black87.withOpacity(0.3),
                                Colors.black54.withOpacity(0.3),
                                Colors.black38.withOpacity(0.3),
                              ],
                              stops: const [0.1, 0.4, 0.6, 0.9],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 90,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 30,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withAlpha(150),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(25)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "News of the day",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            color: AppColors.white,
                                          ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                SizedBox(
                                  width: 320,
                                  child: Text(
                                    headlines[0]
                                        .title, //"Vip immunization for the us citizens, for the powerful and their cronics in the us sadasdasd.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Learn More",
                                      style: Theme.of(context)
                                          .textTheme
                                          .button!
                                          .copyWith(
                                            color: AppColors.white,
                                          ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Top Headlines ",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                                height: size.height / 3,
                                child: HeadlinesList(headlines: headlines))),
                      ],
                    )
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.black,
              ),
            );
          }),
    );
  }
}
