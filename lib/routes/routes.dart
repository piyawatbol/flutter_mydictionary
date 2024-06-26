import 'package:flutter_mydictionary/screen/home/home_screen.dart';
import 'package:flutter_mydictionary/screen/home/oxford/oxford_screen.dart';
import 'package:flutter_mydictionary/screen/home/random/random_screen.dart';
import 'package:flutter_mydictionary/screen/home/vocab/add_vocab_screen.dart';
import 'package:flutter_mydictionary/screen/home/find/find_letter_screen.dart';
import 'package:flutter_mydictionary/screen/home/vocab/vocab_screen.dart';
import 'package:get/get.dart';

import '../screen/home/oxford/oxford_add_screen.dart';

class Approutes {
  static final home = '/home';
  static final vocab = '/vocab';
  static final vocab_detail = '/vocab/detail';
  static final vocab_add = '/vocab/add';
  static final find_letter = '/letter';
  static final random = "/random";
  static final oxford = "/oxford";
  static final oxford_add = "/oxford/add";

  static final getPages = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: vocab, page: () => VocabScreen()),
    GetPage(name: vocab_add, page: () => VocabAddScreen()),
    GetPage(name: find_letter, page: () => FindLetterScreen()),
    GetPage(name: random, page: () => RandomScreen()),
    GetPage(name: oxford, page: () => OxfordScreen()),
    GetPage(name: oxford_add, page: () => OxfordAddScreen()),
  ];
}
