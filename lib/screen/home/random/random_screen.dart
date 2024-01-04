import 'package:flutter/material.dart';
import 'package:flutter_mydictionary/controllers/vacab_controller.dart';
import 'package:flutter_mydictionary/widget/autext/auto_text.dart';
import 'package:get/get.dart';

import '../../../widget/button/custom_button.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<VocabController>(
        init: VocabController(),
        builder: (controller) {
          return Container(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                controller.random == null
                    ? SizedBox()
                    : Column(
                        children: [
                          AutoText(
                            "${controller.random?.mean}",
                            fontSize: 40,
                          ),
                          AutoText(
                            "${controller.random?.word}",
                            fontSize: 40,
                          ),
                        ],
                      ),
                SizedBox(height: size.height * 0.1),
                CustomButton(
                  title: "Random",
                  ontap: () {
                    controller.getRandom();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
