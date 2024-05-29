import 'dart:convert';
import 'package:api_get/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductControllers {
  final List<Product> _list = [];

  List<Product> get products => List.unmodifiable(_list);

  Future<void> getUser() async {
    try {
      final response =
          await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));

      if (response.statusCode == 200) {
        List jsonResponse = jsonDecode(response.body);
        _list.clear();
        for (var productinfo in jsonResponse) {
          _list.add(Product(
            name: productinfo["title"].toString(),
            title: productinfo["category"]["name"],
            price: productinfo["price"],
            imagepath: productinfo["images"][0],
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
