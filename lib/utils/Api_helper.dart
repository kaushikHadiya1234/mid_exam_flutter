import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mid_exam_flutter/screen/Model/Search_model.dart';
import 'package:mid_exam_flutter/screen/Model/review_model.dart';

class Apihelper {

  static Apihelper apihelper = Apihelper();
  Future<SearchModel> ApiSearchData() async {
    String? link =
        'https://real-time-product-search.p.rapidapi.com/search?q=Nikeshoes&country=us&language=en';
    var res = await http.get(Uri.parse(link),headers: {
    'X-RapidAPI-Key': '7e5b50ff69mshda93e4ea3222797p15fa55jsn7ce191ea8264',
    'X-RapidAPI-Host': 'real-time-product-search.p.rapidapi.com'
    },);

    var json = jsonDecode(res.body);
    print(json);

    SearchModel searchModel = SearchModel.fromJson(json);
    print(searchModel.status);

    return searchModel;
  }

  Future<ReviewModel> ApiReviewData()
  async {
    String? link1 ='https://real-time-product-search.p.rapidapi.com/product-reviews?product_id=11577822456427762145&country=us&language=en';
    var res = await http.get(Uri.parse(link1),headers: {
      'X-RapidAPI-Key': '7e5b50ff69mshda93e4ea3222797p15fa55jsn7ce191ea8264',
      'X-RapidAPI-Host': 'real-time-product-search.p.rapidapi.com'
    });

    var json = jsonDecode(res.body);
    print(json);

    ReviewModel reviewModel = ReviewModel.fromJson(json);


    return reviewModel;

  }
}
