import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/colors.dart';

class Articleswidget extends StatelessWidget {
  final int index;
  final String title;
  final String? urlToImage;
  final String publishedAt;
  final String url;
  final String? author;
  const Articleswidget(
      {Key? key,
      required this.url,
      required this.index,
      required this.title,
      required this.urlToImage,
      required this.publishedAt,
      required this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Uri articleurl = Uri.parse(url);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(articleurl)) {
            await launchUrl(articleurl);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              child: CachedNetworkImage(
                imageUrl: urlToImage.toString(),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.black,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                height: 80,
                width: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        CupertinoIcons.time,
                        color: AppColors.grey,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        publishedAt.substring(0, 10),
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: AppColors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
