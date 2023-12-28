import 'package:flutter_dotenv/flutter_dotenv.dart';

String prodUrl = dotenv.env['PROD_URL']!;
String devUrl = dotenv.env['DEV_URL']!;
