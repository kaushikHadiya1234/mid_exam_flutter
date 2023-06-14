
import 'package:flutter/material.dart';
import 'package:mid_exam_flutter/screen/Model/Search_model.dart';
import 'package:mid_exam_flutter/screen/Model/review_model.dart';
import 'package:mid_exam_flutter/utils/Api_helper.dart';

class SearchProvider extends ChangeNotifier {
  Future<SearchModel> getData() {
    return Apihelper.apihelper.ApiSearchData();
  }

  Future<ReviewModel> getReview()
  {
    return Apihelper.apihelper.ApiReviewData();
  }

}