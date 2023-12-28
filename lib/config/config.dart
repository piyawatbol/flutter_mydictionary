import 'env.dart';

enum Environment { dev, prod }

abstract class AppEnvironment {
  static late String baseUrl;

  static void setupEnv(Environment env) {
    switch (env) {
      case Environment.prod:
        baseUrl = "${prodUrl}";
        break;
      case Environment.dev:
        baseUrl = "${devUrl}";
        break;
    }
  }
}
