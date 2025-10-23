import 'package:flutter/material.dart';
import 'package:norticeboard/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(
    id: "",
    name: "",
    email: "",
    phone: "",
    password: "",
    role: "user",
  );

  UserModel get user => _user;

  void setUser(String user) {
    _user = UserModel.fromJson(user);
    notifyListeners();
  }

  void logOut() {
    _user = UserModel(
      id: "",
      name: "",
      email: "",
      phone: "",
      password: "",
      role: "user",
    );

    notifyListeners();
  }
}