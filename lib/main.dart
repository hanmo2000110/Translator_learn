import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hem_intership/screens/choice_page.dart';
import 'package:hem_intership/screens/home_page.dart';
import 'package:hem_intership/screens/loading_page.dart';
import 'package:hem_intership/screens/result_page.dart';
import 'package:hem_intership/screens/take_picture_page.dart';
import 'package:hem_intership/screens/write_text_page.dart';

import 'binding/binding.dart';

Future<void> main() async {
  // await Firebase.initializeApp();
  runApp(const MultiTranslator());
}

class MultiTranslator extends StatelessWidget {
  const MultiTranslator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String apiKey = "AIzaSyBgQdD1yHaoyBWNqWPoNsEFEZoz2y8kjMw";
    return GoogleTranslatorInit(
      apiKey,
      translateFrom: Locale('en'),
      translateTo: Locale('ko'),
      builder: () => GetMaterialApp(
        // darkTheme: ThemeData.dark(),
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        initialBinding: Binding(),
        title: 'MultiTranslator',
        initialRoute: '/',
        getPages: [
          GetPage(
            name: "/",
            page: () => HomePage(),
            transition: Transition.fadeIn,
          ),
          GetPage(
              name: "/write",
              page: () => WriteTextPage(),
              transition: Transition.noTransition),
          GetPage(
              name: "/result",
              page: () => ResultPage(),
              transition: Transition.fade),
          GetPage(
              name: "/choice",
              page: () => ChoicePage(),
              transition: Transition.noTransition),
          GetPage(
              name: "/load",
              page: () => LoadingPage(),
              transition: Transition.noTransition),
          GetPage(
              name: "/take",
              page: () => TakePicturePage(),
              transition: Transition.noTransition),
        ],
      ),
    );
  }
}
