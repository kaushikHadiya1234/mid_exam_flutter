import 'package:flutter/material.dart';
import 'package:mid_exam_flutter/screen/View/review_screen.dart';
import 'package:mid_exam_flutter/screen/View/search_screen.dart';
import 'package:mid_exam_flutter/screen/View/splace_screen.dart';
import 'package:mid_exam_flutter/screen/View/view_screen.dart';
import 'package:mid_exam_flutter/screen/provider/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: Sizer(
        builder: (context, orientation, deviceType) =>  MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'splace',
          routes: {
            '/': (context) => SearchScreen(),
            'view': (context) => ViewScreen(),
            'splace': (context) => SplaceScreen(),
            're': (context) => ReviewScreen(),
          },
        ),
      ),
    ),
  );
}
