import 'package:flutter/material.dart';
import 'package:mid_exam_flutter/screen/Model/Search_model.dart';
import 'package:mid_exam_flutter/screen/Model/review_model.dart';
import 'package:mid_exam_flutter/screen/View/search_screen.dart';
import 'package:mid_exam_flutter/screen/provider/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    pf = Provider.of<SearchProvider>(context, listen: false);
    pt = Provider.of<SearchProvider>(context, listen: true);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Review"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: pf!.getReview(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('lose Conection'));
          } else if (snapshot.hasData) {
           ReviewModel? reviewModel= snapshot.data;
            // print(searchmodel!.data!.length);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child:  ListView.builder(itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    children: [
                      Text("${reviewModel!.data![index].reviewTitle}"),
                      Text("${reviewModel!.data![index].rating}"),
                      Text("${reviewModel!.data![index].reviewAuthor}"),
                      Text("${reviewModel!.data![index].reviewId}"),
                      Text("${reviewModel!.data![index].reviewSource}"),
                      Text("${reviewModel!.data![index].reviewDatetimeUtc}"),
                      Text("${reviewModel!.data![index].rating}"),
                    ],
                  ),
                );
              },
                itemCount: reviewModel!.data!.length,
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ),);
  }
}
/*
* ListView.builder(itemBuilder: (context, index) {
        return Container(
          height: 200,
          width: 90.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[300],
          ),
          child: Column(
            children: [

            ],
          ),
        );
      },),
* */