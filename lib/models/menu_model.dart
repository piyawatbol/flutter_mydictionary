import 'package:flutter/material.dart';
import 'package:flutter_mydictionary/routes/routes.dart';

class MenuModel {
  final String name;
  final IconData icon;
  final String route;
  MenuModel({required this.name, required this.icon, required this.route});
}

List<MenuModel> menuList = [
  MenuModel(name: 'Vocabulary', icon: Icons.abc, route: Approutes.vocab),
  MenuModel(name: 'Add Vocabulary', icon: Icons.abc, route: Approutes.vocab_add)
];
