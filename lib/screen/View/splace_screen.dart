import 'package:flutter/material.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),()=>Navigator.pushReplacementNamed(context, '/'));
    return SafeArea(child: Scaffold(body: Center(child: Image.asset('assets/images/e.png'),),),);
  }
}
