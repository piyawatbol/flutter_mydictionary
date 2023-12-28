import 'package:flutter_mydictionary/screen/home/home_screen.dart';
import 'package:flutter_mydictionary/screen/home/vocab/add_vocab_screen.dart';
import 'package:flutter_mydictionary/screen/home/vocab/vocab_screen.dart';
import 'package:get/get.dart';

class Approutes {
  static final home = '/home';
  static final vocab = '/vocab';
  static final vocab_detail = '/vocab/detail';
  static final vocab_add = '/vocab/add';

  static final getPages = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: vocab, page: () => VocabScreen()),
    GetPage(name: vocab_add, page: () => VocabAddScreen()),
  ];
}
