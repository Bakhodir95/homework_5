import 'package:api_get/controllers/product_controller.dart';
import 'package:api_get/controllers/user_controller.dart';
import 'package:api_get/models/user.model.dart';
import 'package:api_get/views/screens/first_page.dart';
import 'package:api_get/views/screens/second_screen.dart';
import 'package:api_get/views/widgets/product_widget.dart';
import 'package:api_get/views/widgets/user_widget.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _FirstPageState();
}

class _FirstPageState extends State<ThirdScreen> {
  UserController userController = UserController();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    await userController.getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirstPage(),
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
        itemCount: userController.users.length,
        itemBuilder: (context, index) {
          return UserWidget(userController.users[index]);
        },
      ),
    );
  }
}
