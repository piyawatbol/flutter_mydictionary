import 'package:flutter/material.dart';
import 'package:flutter_mydictionary/controllers/oxford_controller.dart';
import 'package:flutter_mydictionary/models/oxford_model.dart';
import 'package:flutter_mydictionary/widget/autext/auto_text.dart';
import 'package:get/get.dart';

class OxfordScreen extends StatelessWidget {
  const OxfordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OxfordController>(
      init: OxfordController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  controller.hideMean = !controller.hideMean;
                  controller.update();
                },
                icon: Icon(Icons.visibility),
              )
            ],
          ),
          body: Column(
            children: [
              buildVocapList(controller),
            ],
          ),
        );
      },
    );
  }

  Widget buildVocapList(OxfordController controller) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.oxfordList.length,
        itemBuilder: (BuildContext context, int index) {
          OxfordModel vocab = controller.oxfordList[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(2, 2))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoText(
                    "${vocab.word}",
                    fontWeight: FontWeight.w600,
                  ),
                  controller.hideMean
                      ? SizedBox()
                      : AutoText(
                          "${vocab.mean}",
                          fontWeight: FontWeight.w400,
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
