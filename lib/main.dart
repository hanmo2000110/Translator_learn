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

/*
papago 언어 인식 가능 해당 언어를 기반으로 입력 언어 선택가능 
출력 언어 또한 http 요청시에 선택가능 단점으로는 하루에 10000?자 제한 있음 


google translator package 단점 : 입력 언어 출력 언어 설정이 메인에서만 가능 
만약 하게 된다면 미리 자신의 언어를 설정해야 하도록 해야 여러 언어를 번역 가능할 것 같다. 
google cloud translator 기반으로 만들어진 듯 하다. 언어 설정을 앱 내에서도 가능하게 바꾸지 않는다면 
차라리 http로 받아오는 게 나을듯 하다





*/
