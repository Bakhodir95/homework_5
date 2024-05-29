import 'package:api_get/controllers/category_controller.dart';
import 'package:api_get/controllers/product_controller.dart';
import 'package:api_get/views/screens/third_screen.dart';
import 'package:api_get/views/widgets/category_widget.dart';
import 'package:api_get/views/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _FirstPageState();
}

class _FirstPageState extends State<SecondScreen> {
  CategoryController categoryController = CategoryController();
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    await categoryController.getCategory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Internet Magazin',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdScreen(),
                    ));
              },
              icon: const Icon(
                Icons.next_plan_outlined,
                size: 30,
                color: Colors.blue,
              ))
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: categoryController.categories.length,
        itemBuilder: (context, index) {
          return CategoryWidget(categoryController.categories[index]);
        },
      ),
    );
  }
}
