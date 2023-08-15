import 'package:flutter/material.dart';
import 'package:jingle_shop/models/user.dart';
class UserProvider extends ChangeNotifier{
  User _user = User(
      id: '',
      name: '',
      email: '',
      password: '',
      type: '',
      address: '',
      token: '',
      cart:[],
      wishList: [],
      );
  User get user => _user;
  void setUser(String user){
    _user = User.fromJson(user);
    //print(_user.token);
    notifyListeners();
  }
  void setUserFromModel(User user){
    _user = user;
    notifyListeners();
  }
}
