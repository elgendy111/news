import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_responce/news.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({required this.news, super.key});
  final News news;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/pattern.png',
            ),
            fit: BoxFit.fill),
        color: AppTheme.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'News Title',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.network(
                  news.urlToImage ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNNLEL-qmmLeFR1nxJuepFOgPYfnwHR56vcw&s',
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/no_image.png');
                  },
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                news.source?.name ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppTheme.grey, fontSize: 10),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                news.title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppTheme.navy, fontSize: 14),
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  timeago.format(news.publishedAt ?? DateTime.now()),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppTheme.grey, fontSize: 13),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(news.description ?? ''),
              const Spacer(),
              GestureDetector(
                onTap: () => _launchURL(context, news.url ?? ''),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'View Full article',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppTheme.navy,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.arrow_right,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch the article')),
      );
    }
  }
}
