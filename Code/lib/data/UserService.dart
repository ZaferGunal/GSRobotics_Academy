import 'dart:core';

import '../models/UserModel.dart';

class UserService {

  static List<UserModel> users = [];

  static UserService _singelton = UserService.internal();

  factory UserService(){
    return _singelton;
  }

  UserService.internal();

  static List<UserModel> getData(){
    return users;
  }
}