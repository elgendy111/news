import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constant.dart';
import 'package:news/models/news_responce/news_responce.dart';
import 'package:news/models/sources_responce/sources_responce.dart';

class ApiService {
  static Future<SourcesResponce> getSources(categoryId) async {
    final url = Uri.https(
      APIConstant.baseUrl,
      APIConstant.soucesEndpoint,
      {
        'apiKey': APIConstant.apiKey,
        'category': categoryId,
      },
    );
    final responce = await http.get(url);
    final json = jsonDecode(responce.body);
    return SourcesResponce.fromJson(json);
  }

  static Future<NewsResponce> getNews(
    sourceId,
  ) async {
    final url = Uri.https(
      APIConstant.baseUrl,
      APIConstant.newsEndpoint,
      {
        'apiKey': APIConstant.apiKey,
        'sources': sourceId,
      },
    );
    final responce = await http.get(url);
    final json = jsonDecode(responce.body);
    return NewsResponce.fromJson(json);
  }

  static Future<NewsResponce> searchNews(String query) async {
    final url = Uri.https(APIConstant.baseUrl, APIConstant.searchEndpoint,
        {'apiKey': APIConstant.apiKey, 'q': query});
    final responce = await http.get(url);
    final json = jsonDecode(responce.body);
    return NewsResponce.fromJson(json);
  }
}
