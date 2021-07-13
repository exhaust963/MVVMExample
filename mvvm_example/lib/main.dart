import 'package:flutter/material.dart';
import 'package:mvvm_example/pages/user/user_view.dart';
import 'package:mvvm_example/pages/user/user_view_model.dart';
import 'package:provider/provider.dart';

 void main() {

  runApp(
    ChangeNotifierProvider(
      create: (context) => UserViewModel(),
      child: MyApp(),
    ),
  );
  
}

class MyApp extends StatelessWidget {
  String title="MVVM Example";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: UserView(),
      ),
    );
  }
}