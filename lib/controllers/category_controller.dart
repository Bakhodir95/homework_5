import 'dart:convert';
import 'package:api_get/models/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CategoryController {
  final List<CategoryPart> _list = [];

  List<CategoryPart> get categories => List.unmodifiable(_list);

  Future<void> getCategory() async {
    try {
      final response = await http
          .get(Uri.parse("https://api.escuelajs.co/api/v1/categories"));

      if (response.statusCode == 200) {
        List jsonResponse = jsonDecode(response.body);
        _list.clear();
        for (var categoriesinfo in jsonResponse) {
          _list.add(CategoryPart(
            title: categoriesinfo["name"],
            imagepath: categoriesinfo["image"],
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
