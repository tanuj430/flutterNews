import 'dart:convert';

import 'package:first_app/models/news_Headlines_Model.dart';
import 'package:http/http.dart' as http;

class newsRepository{

  String? endPoint;
  newsRepository({required this.endPoint});
  Future<newsHeadlinesModel> getData()async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=cb65c37d80154b86ba18cc318626936e";
    final response = await http.get(Uri.parse(endPoint.toString()));

    if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        return newsHeadlinesModel.fromJson(data);
    }
    throw Exception("Error");
  }

}