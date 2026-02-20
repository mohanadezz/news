import 'package:flutter/cupertino.dart';
import 'package:news/models/article_data.dart';
import 'package:news/models/source_data_model.dart';
import 'package:news/network_handler/network_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewModel extends ChangeNotifier {
  List<SourceData> _sourcesList = [];
  List<ArticleData> _articlesList = [];
  int _selectedTapIndex = 0;

  List<SourceData> get sourcesList => _sourcesList;

  List<ArticleData> get articlesList => _articlesList;

  int get selectedTapIndex => _selectedTapIndex;

  void selectedIndex(int index) {
    _selectedTapIndex = index;
    getAllArticles();
    notifyListeners();
  }

  Future<void> getAllSources(String categoryId) async {
    try {
      _sourcesList = await NetworkHandler.getAllSources(categoryId);
      notifyListeners();
    } catch (_) {
      throw Exception('error');
    }
  }

  Future<void> getAllArticles() async {
    try {
      _articlesList = await NetworkHandler.getAllArticles(
        _sourcesList[_selectedTapIndex].id,
      );
      notifyListeners();
    } catch (_) {
      throw Exception('error');
    }
  }

  void openUrl(ArticleData article) {
    if (article.url != '') {
      launchUrl(Uri.parse(article.url));
    } else {
      throw Exception('there is no article');
    }
  }
}
