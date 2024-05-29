import 'package:api_get/models/category_model.dart';
import 'package:api_get/models/product_model.dart';
import 'package:api_get/models/user.model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserWidget extends StatefulWidget {
  final UserPart user;
  UserWidget(this.user, {super.key});

  @override
  State<UserWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 15,
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  width: MediaQuery.of(context).size.width / 3 - 50,
                  child: Image.network(
                    widget.user.imagepath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(10),
              Text(
                widget.user.name,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
