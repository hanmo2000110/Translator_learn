import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hem_intership/controller/translation_controller.dart';

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
                height: 50,
              ),
              Text(
                "Papago",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                tc.result_papago,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Google Translator",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                tc.result_cloud_google,
              ).translate(),
            ],
          ),
        ],
      ),
    );
  }
}
