import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class AppState extends ChangeNotifier {
  String name = '';
  String selectedUserName = '';
  List<User> users = [];
  int currentPage = 1;
  bool isLoading = false;

  void setName(String newName) {
    name = newName;
    notifyListeners();
  }

  void setSelectedUserName(String newName) {
    selectedUserName = newName;
    notifyListeners();
  }

  Future<void> fetchUsers({bool refresh = false}) async {
    if (refresh) {
      currentPage = 1;
      users.clear();
    }

    if (isLoading) return;

    isLoading = true;
    notifyListeners();

    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$currentPage&per_page=10'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final newUsers = (data['data'] as List)
          .map((userData) => User.fromJson(userData))
          .toList();
      users.addAll(newUsers);
      currentPage++;
    }

    isLoading = false;
    notifyListeners();
  }

  bool isPalindrome(String text) {
    String cleanText = text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return cleanText == cleanText.split('').reversed.join('');
  }
}