import 'package:flutter/material.dart';
import 'package:flutter_mydictionary/controllers/vacab_controller.dart';
import 'package:flutter_mydictionary/models/vocab_model.dart';
import 'package:flutter_mydictionary/screen/home/vocab/vocab_detail_screen.dart';
import 'package:flutter_mydictionary/widget/autext/auto_text.dart';
import 'package:get/get.dart';

class VocabScreen extends StatelessWidget {
  const VocabScreen({super.key});

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
            child: controller.vocabList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: Column(
                      children: [buildVocapList(controller)],
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget buildVocapList(VocabController controller) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.vocabList.length,
        itemBuilder: (BuildContext context, int index) {
          VocabModel vocab = controller.vocabList[index];
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
