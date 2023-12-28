import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mydictionary/config/config.dart';
import 'package:flutter_mydictionary/screen/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routes/routes.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  AppEnvironment.setupEnv(Environment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.kanitTextTheme()),
      getPages: Approutes.getPages,
      home: HomeScreen(),
    );
  }
}
