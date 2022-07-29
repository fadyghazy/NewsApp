import 'dart:convert';
import '../../model/articlesmodel.dart';
import 'package:http/http.dart'as http;
class APIClass {

  static fetchNewsCategories(String Category) async {
    List<ArticlesModel>listDataModel = [];
    try {
      String APIKEY = "40ee926462f140f19db1b276e64e45a7";
      var url = Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=eg&category=$Category&apiKey=$APIKEY");
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body)["articles"];
      for (var i in responsebody) {
        listDataModel.add(ArticlesModel(title: i["title"],
            description: i["description"],
            url: i["url"],
            urlToImage: i["urlToImage"]));
        print(listDataModel);
        return listDataModel;
      }
    }
    catch (e) {
      print("e$e");
    }


    }


  }


