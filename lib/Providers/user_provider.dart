import 'package:flutter/material.dart';

import '../Models/random_user.dart';
import '../Services/random_user_service.dart';

class RandomUserProvider extends ChangeNotifier {
  List<RandomUser> _users = [];

  List<RandomUser> get users => _users;

  Future<void> fetchRandomUsers() async {
    _users = await RandomUserService.fetchRandomUsers(10);
    notifyListeners();
  }
}
