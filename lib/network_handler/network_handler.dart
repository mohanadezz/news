import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/article_data.dart';
import 'package:news/models/source_data_model.dart';
import 'package:news/network_handler/api_constant.dart';
import 'package:news/network_handler/end_points.dart';

class NetworkHandler {
  static Future<List<SourceData>> getAllSources(String categoryId) async {
    try {
      Map<String, dynamic> queryParameters = {
        "apiKey": ApiConstant.apiKey,
        "category": categoryId,
      };
      final response = await http.get(
        Uri.https(ApiConstant.baseUrl, EndPoints.allSources, queryParameters),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        SourceDataModel sourceDataModel = SourceDataModel.fromJson(data);
        return sourceDataModel.sources;
      } else {
        throw Exception('something went wrong');
      }
    } catch (error) {
      throw Exception('something went wrong');
    }
  }

  static Future<List<ArticleData>> getAllArticles(String sourceId) async {
    try {
      Map<String, dynamic> queryParameters = {
        "apiKey": ApiConstant.apiKey,
        'sources': sourceId,
      };
      final response = await http.get(
        Uri.https(ApiConstant.baseUrl, EndPoints.allArticles, queryParameters),
      );
      List<ArticleData> articlesList = [];
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var element in data['articles']) {
          ArticleData articleData = ArticleData.formJson(element);
          articlesList.add(articleData);
        }
        return articlesList;
      } else {
        throw Exception('something went wrong');
      }
    } catch (_) {
      throw Exception('something went wrong');
    }
  }
}
