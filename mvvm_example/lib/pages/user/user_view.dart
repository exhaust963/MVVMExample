import 'package:flutter/material.dart';
import 'package:mvvm_example/models/user_model.dart';
import 'package:mvvm_example/pages/user/user_view_model.dart';
import 'package:provider/provider.dart';

class UserView extends StatelessWidget {
  List<UserModel> userModel=[];
  
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserViewModel>(context);
    userModel=provider.getUser;
    return Scaffold(
      body:provider.state ==UserState.IDLE ? Consumer<UserViewModel>(
        builder: (_,userViewModel,__) {
          return ListView.builder(
            itemCount: userModel.length,
            itemBuilder:(context,index){
            return Text(userModel[index].name!);
          });
        },
      ):CircularProgressIndicator()
    );
  }
}