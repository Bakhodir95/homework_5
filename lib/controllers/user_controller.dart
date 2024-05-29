import 'dart:convert';
import 'package:api_get/models/category_model.dart';
import 'package:api_get/models/user.model.dart';
import 'package:http/http.dart' as http;

class UserController {
  final List<UserPart> _list = [];

  List<UserPart> get users => List.unmodifiable(_list);

  Future<void> getUsers() async {
    try {
      final response =
          await http.get(Uri.parse("https://api.escuelajs.co/api/v1/users"));

      if (response.statusCode == 200) {
        List jsonResponse = jsonDecode(response.body);
        _list.clear();
        for (var userInfo in jsonResponse) {
          _list.add(UserPart(
            name: userInfo["name"],
            imagepath: userInfo["avatar"],
          ));
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print('Error fetching products: $error');
    }
  }
}
