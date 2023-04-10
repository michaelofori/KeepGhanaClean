import 'package:http/http.dart' as http;

import 'dart:convert';

import '../modelsnews/article.dart';
import '../secret.dart';



class News {

  List<Article> news  = [];

  Future<void> getNews() async{

     String url = "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=$apiKey";

   // String url ="http://api.mediastack.com/v1/news?access_key=fc6c4386361c768e9521be6b173e745";
    var response = await http.get(url as Uri);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }


  }


}


class NewsForCategorie {

  List<Article> news  = [];

  Future<void> getNewsForCategory(String category) async{

    String url = "http://newsapi.org/v2/everything?q=$category&apiKey=$apiKey";
    // String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey";
 //String url ="http://api.mediastack.com/v1/news?access_key=fc6c4386361c768e9521be6b173e745";
    var response = await http.get(url as Uri);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }


  }


}


