import 'news.dart';

class NewsResponce {
  String? status;
  int? totalResults;
  List<News>? news;

  NewsResponce({this.status, this.totalResults, this.news});

  factory NewsResponce.fromJson(Map<String, dynamic> json) => NewsResponce(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        news: (json['articles'] as List<dynamic>?)
            ?.map((e) => News.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': news?.map((e) => e.toJson()).toList(),
      };
}
