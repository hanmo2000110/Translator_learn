import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hem_intership/controller/translation_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  TranslationController tc = Get.put(TranslationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Translator"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Get.offAll(HomePage());
          },
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: Get.width - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.red.shade300,
                    width: 8,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "여러 번역기 모델들이 번역한 결과입니다!\n이중에 가장 적합하다고 생각되는 모델을\n 클릭해 투표해주세요!!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Get.dialog(
                    Dialog(
                      child: Container(
                        height: 200,
                        width: 100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Papago\n번역이 제일 좋다!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    _incrementCounter('papago');
                                    Get.offAll(HomePage());
                                  },
                                  child: Text("투표하기")),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: Get.width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.greenAccent.shade200,
                      width: 8,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Papago",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          tc.result_papago,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.dialog(
                    Dialog(
                      child: Container(
                        height: 200,
                        width: 100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Google Translator\n번역이 제일 좋다!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    _incrementCounter('google');
                                    Get.offAll(HomePage());
                                  },
                                  child: Text("투표하기")),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: Get.width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey,
                      width: 8,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Google Translator",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: Get.width - 90,
                        child: Text(
                          tc.result_cloud_google,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ).translate(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.dialog(
                    Dialog(
                      child: Container(
                        height: 200,
                        width: 100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Google Cloud Translate\n번역이 제일 좋다!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue[600],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    _incrementCounter('cloud');
                                    Get.offAll(HomePage());
                                  },
                                  child: Text("투표하기")),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: Get.width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.blue,
                      width: 8,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Google Cloud Translate",
                        style: TextStyle(
                          color: Colors.blue.shade600,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: Get.width - 90,
                        child: Text(
                          tc.result_cloud_google,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.dialog(
                    Dialog(
                      child: Container(
                        height: 200,
                        width: 100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Kakao i Translate\n번역이 제일 좋다!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.yellow.shade600,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    _incrementCounter('kakao');
                                    Get.offAll(HomePage());
                                  },
                                  child: Text("투표하기")),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: Get.width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.yellow.shade200,
                      width: 8,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Kakao i Translate",
                        style: TextStyle(
                          color: Colors.yellow[600],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: Get.width - 120,
                        child: Text(
                          tc.result_kakao,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _incrementCounter(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt(name) ?? 1) + 1;
    print('Pressed $counter times.');
    await prefs.setInt(name, counter);
  }
}
