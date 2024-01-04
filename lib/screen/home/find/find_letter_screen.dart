import 'package:flutter/material.dart';
import 'package:flutter_mydictionary/controllers/vacab_controller.dart';
import 'package:get/get.dart';

class FindLetterScreen extends StatelessWidget {
  FindLetterScreen({super.key});

  final List<String> alphabet = List.generate(
      26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));

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
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: alphabet.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          controller.getVocabOnlyletter(alphabet[index]);
                        },
                        child: Card(
                          child: Center(
                            child: Text(
                              alphabet[index],
                              style: TextStyle(fontSize: 24.0),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
