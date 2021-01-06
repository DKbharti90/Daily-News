import 'dart:convert';

import 'package:news_app/model/news_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<NewsModel> news=[];



  Future<void> getNews() async {

    String url="http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=52a2e492325444dc87deb92f36f565a1";
    var response= await http.get(url);
    var jsonData=jsonDecode(response.body);

    if(jsonData['status']=="ok"){
      print(jsonData['articles']);

      jsonData['articles'].forEach((elemet){
        if(elemet['description']!=null && elemet['urlToImage']!=null){

          NewsModel articles=new NewsModel(
             author:elemet['author'],
             title:elemet['title'],
             description:elemet['description'],
             url:elemet['url'],
             urlToImage:elemet['urlToImage'],
         //  publishedAt:elemet['publishedAt'],
           content:elemet['content'],

         );
         news.add(articles);


        }

      });
    }else{

    }

  }




}