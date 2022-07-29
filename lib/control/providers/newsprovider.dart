import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../../model/articlesmodel.dart';
import 'package:http/http.dart'as http;
class NewsProvider extends ChangeNotifier {
  List<ArticlesModel>listDataModel = [];
  NewsProvider() {
    getAllData();
  }
  String selectedCategory = "general";
// Dio dio = Dio();



  changeCategory(String category){
    selectedCategory = category;
    getAllData();
    notifyListeners();
  }
  getAllData() async {
    listDataModel = [];


    try {
      String APIKEY = "40ee926462f140f19db1b276e64e45a7";
      var url = Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=eg&apiKey=$APIKEY");
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body)["articles"];
      for (var i in responsebody) {
        listDataModel.add(ArticlesModel(title: i["title"],
            description: i["description"],
            url: i["url"],
            urlToImage: i["urlToImage"]));

      }

      notifyListeners();
      print(listDataModel);

    }
    catch (e) {
      print("e$e");
    }

  }
  notifyListeners();
}
