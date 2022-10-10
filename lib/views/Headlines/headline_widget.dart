import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

class HeadlineWidget extends StatelessWidget {
  final int index;
  final String title;
  final String? urlToImage;
  final String publishedAt;
  final String? author;
  const HeadlineWidget(
      {Key? key,
      required this.index,
      required this.title,
      required this.urlToImage,
      required this.publishedAt,
      required this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: 
                CachedNetworkImage(
              imageUrl: urlToImage.toString(),
              placeholder: (context, url) =>const Center(
                child:  CircularProgressIndicator(
                  color: AppColors.black,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
               fit: BoxFit.cover,
                  height: 125,
                  width: size.width * 0.5,
            ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SizedBox(
                width: size.width * 0.5,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Text(
                publishedAt.substring(0, 10),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: AppColors.grey),
              ),
              Text(
                "By $author",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ));
  }
}
