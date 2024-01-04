import 'package:flutter/material.dart';
import 'package:flutter_mydictionary/controllers/vacab_controller.dart';
import 'package:get/get.dart';

import '../../../models/vocab_model.dart';
import '../../../widget/autext/auto_text.dart';
import '../vocab/vocab_detail_screen.dart';

class FindDetailScreen extends StatelessWidget {
  final List<VocabModel> vocabList;
  const FindDetailScreen({required this.vocabList});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<VocabController>(
      init: VocabController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: AutoText("${controller.findList.length}"),
          ),
          body: Container(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                buildVocapList(),
              ],
            ),
          ),
        );
      },
    );
  }

  // Scaffold(
  //     appBar: AppBar(),
  //     body: Container(
  //       width: size.width,
  //       height: size.height,
  //       child: Column(
  //         children: [
  //           buildVocapList(),
  //         ],
  //       ),
  //     ),
  //   );

  Widget buildVocapList() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: vocabList.length,
        itemBuilder: (BuildContext context, int index) {
          VocabModel vocab = vocabList[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => VocabDetailScreen(vocab: vocab));
            },
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
                  AutoText(
                    "${vocab.mean}",
                    fontWeight: FontWeight.w400,
                  ),
                  AutoText(
                    "${vocab.count}",
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
