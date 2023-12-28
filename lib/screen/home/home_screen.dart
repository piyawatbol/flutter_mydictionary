import 'package:flutter/material.dart';
import 'package:flutter_mydictionary/controllers/vacab_controller.dart';
import 'package:flutter_mydictionary/models/menu_model.dart';
import 'package:flutter_mydictionary/widget/autext/auto_text.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<VocabController>(
        init: VocabController(),
        builder: (controller) {
          return Container(
            width: size.width,
            height: size.height,
            child: SafeArea(
              child: Column(
                children: [buildMenuList()],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildMenuList() {
    return SizedBox(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: menuList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (() {
              Get.toNamed(menuList[index].route);
            }),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 4),
                    blurRadius: 10,
                    spreadRadius: 1,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoText("${menuList[index].name}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
