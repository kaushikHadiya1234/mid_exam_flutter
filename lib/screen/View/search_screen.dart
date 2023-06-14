import 'package:flutter/material.dart';
import 'package:mid_exam_flutter/screen/Model/Search_model.dart';
import 'package:mid_exam_flutter/screen/Model/my_model.dart';
import 'package:mid_exam_flutter/screen/provider/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

SearchProvider? pf;
SearchProvider? pt;


class _SearchScreenState extends State<SearchScreen> {

  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<SearchProvider>(context, listen: false).getData();
  // }
  @override
  Widget build(BuildContext context) {
    pf = Provider.of<SearchProvider>(context, listen: false);
    pt = Provider.of<SearchProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: pf!.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('lose Conection'));
                  } else if (snapshot.hasData) {
                    SearchModel? searchmodel = snapshot.data;
                    // print(searchmodel!.data!.length);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 200,mainAxisSpacing: 10,crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              MyModel m = MyModel(searchModel: searchmodel,index: index);
                              Navigator.pushNamed(context, 'view',arguments: m);
                            },
                            child: Container(
                              height: 200,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black),
                                 color: Colors.white,
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    Image.network('${searchmodel!.data![index].productPhotos![0]}',height: 100,),
                                     Spacer(),
                                     Padding(
                                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                       child: Text('${searchmodel!.data![index].productTitle}',style: TextStyle(color: Colors.black,fontSize: 12.sp),maxLines: 1,),
                                     ),
                                     Text('₹${searchmodel!.data![index].offer!.price}',style: TextStyle(color: Colors.deepOrange,fontSize: 10.sp)),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: searchmodel!.data!.length,
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
