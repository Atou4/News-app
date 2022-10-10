import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/articles.dart';
class ApiService {
  final String country;
  ApiService( this.country);

  final endPointUrl = "newsapi.org";
  final client = http.Client();
Future<List<Article>> getHeadlines() async {
    
    final queryParameters = {
      'country': country,
      'apiKey': '9a913e6e8f134f0c8e14c0220c482b15'
    };
final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }

  Future<List<Article>> getArticles(String keword) async {
    
    final queryParameters = {
      'q': keword,
      'apiKey': '9a913e6e8f134f0c8e14c0220c482b15'
    };
final uri = Uri.https(endPointUrl, '/v2/everything', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}