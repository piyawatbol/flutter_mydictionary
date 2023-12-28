import 'package:flutter/material.dart';
import 'package:flutter_mydictionary/controllers/vacab_controller.dart';
import 'package:flutter_mydictionary/widget/autext/auto_text.dart';
import 'package:flutter_mydictionary/widget/loading/loding.dart';
import 'package:get/get.dart';

import '../../../widget/button/custom_button.dart';

class VocabAddScreen extends StatelessWidget {
  const VocabAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(),
        body: GetBuilder<VocabController>(
          init: VocabController(),
          builder: (controller) {
            return Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height,
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: size.height * 0.2),
                            buildTextFeild(controller.word, "Word"),
                            buildTextFeild(controller.mean, "Mean"),
                            SizedBox(height: 10),
                            CustomButton(
                                title: "Add",
                                ontap: () {
                                  if (controller.word.text.length != 0 &&
                                      controller.mean.text.length != 0) {
                                    controller.addVocab();
                                  }
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                LoadingPage(statusLoading: controller.statusLoading)
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildTextFeild(TextEditingController controller, String head) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoText("${head}"),
          SizedBox(height: 10),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14),
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
