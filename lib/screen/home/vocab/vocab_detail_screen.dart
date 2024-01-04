import 'package:flutter/material.dart';
import 'package:flutter_mydictionary/controllers/vacab_controller.dart';
import 'package:flutter_mydictionary/models/vocab_model.dart';
import 'package:flutter_mydictionary/widget/autext/auto_text.dart';
import 'package:flutter_mydictionary/widget/button/custom_button.dart';
import 'package:get/get.dart';

import '../../../widget/loading/loding.dart';

class VocabDetailScreen extends StatelessWidget {
  final VocabModel vocab;
  const VocabDetailScreen({required this.vocab});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: GetBuilder<VocabController>(
        init: VocabController(),
        builder: (controller) {
          return Stack(
            children: [
              Container(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.1),
                    AutoText(
                      "${vocab.word}",
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 20),
                    AutoText(
                      "${vocab.mean}",
                      fontSize: 40,
                    ),
                    SizedBox(height: 50),
                    CustomButton(
                      title: "count",
                      ontap: () {
                        controller.countVocab(vocab.sId);
                      },
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      title: "delete",
                      ontap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Do you want to delete'),
                              content: Text('Do you want to delete'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    controller.deleteVocab(vocab.sId);
                                  },
                                  child: Text('OK'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              LoadingPage(statusLoading: controller.statusLoading)
            ],
          );
        },
      ),
    );
  }
}
