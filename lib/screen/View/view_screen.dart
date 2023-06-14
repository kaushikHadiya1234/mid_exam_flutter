import 'package:flutter/material.dart';
import 'package:mid_exam_flutter/screen/Model/Search_model.dart';
import 'package:mid_exam_flutter/screen/Model/my_model.dart';
import 'package:mid_exam_flutter/screen/View/search_screen.dart';
import 'package:mid_exam_flutter/screen/provider/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    pf = Provider.of<SearchProvider>(context, listen: false);
    pt = Provider.of<SearchProvider>(context, listen: true);
    MyModel d = ModalRoute.of(context)!.settings.arguments as MyModel;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 40.h,
                  width: 90.w,
                  child: Image.network('${d.searchModel!.data![d.index!].productPhotos![0]}')),
              Container(
                  height: 95.h,
                  width: 90.w,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("${d.searchModel!.data![d.index!].productTitle}",style: TextStyle(fontSize: 12.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                        Text("From ₹${d.searchModel!.data![d.index!].offer!.price}",style: TextStyle(fontSize: 14.sp,color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10),
                        Text("From ₹${d.searchModel!.data![d.index!].productDescription}",style: TextStyle(fontSize: 14.sp,color: Colors.black,),),
                        SizedBox(height: 10),
                        ListTile(
                          title: Text("Offer",style: TextStyle(fontSize: 12.sp,color: Colors.black,),),
                          trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, 're');
                          },
                          child: ListTile(
                            title: Text("Rating",style: TextStyle(fontSize: 12.sp,color: Colors.black,),),
                            trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                          ),
                        ),
                        ElevatedButton(onPressed: () {

                        }, child: Text("Add to Cart"),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),)
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
