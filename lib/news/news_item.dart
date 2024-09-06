import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              'assets/images/NewsTest.png',
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            'BBC news',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppTheme.grey, fontSize: 10),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Why are football's biggest clubs starting a new tournament?",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppTheme.navy, fontSize: 14),
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Text(
              timeago.format(DateTime.now()),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppTheme.grey, fontSize: 13),
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
