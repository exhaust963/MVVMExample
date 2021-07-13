import 'package:flutter/cupertino.dart';
import 'package:mvvm_example/models/user_model.dart';
import 'package:mvvm_example/services/user_service.dart';

class UserViewModel extends ChangeNotifier{

  UserViewModel (){
    fetchUserList();
  }
  List<UserModel> _userModel=[];
  List<UserModel> get getUser =>_userModel;
  UserState get state => _state!;
  UserState? _state;
  
Future<List<UserModel>> fetchUserList() async {
    try {
      state = UserState.BUSY;
      _userModel = await UserService().fetchUsers();
      state = UserState.IDLE;
      return _userModel;
    } catch (e) {
      state = UserState.ERROR;
      return [];
    }
  }
  set state(UserState state) {
    _state = state;
    notifyListeners();
  }
}
enum UserState { 
  IDLE, 
  BUSY, 
  ERROR 
  }
