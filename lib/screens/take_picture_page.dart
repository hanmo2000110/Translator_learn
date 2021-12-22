import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hem_intership/controller/picture_controller.dart';
import 'package:hem_intership/controller/translation_controller.dart';
import 'package:hem_intership/screens/home_page.dart';

class TakePicturePage extends StatefulWidget {
  @override
  _TakePicturePageState createState() => _TakePicturePageState();
}

class _TakePicturePageState extends State<TakePicturePage> {
  PictureController pc = Get.put(PictureController());
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
          SizedBox(
            height: 50,
          ),
          Image.file(
            File(pc.image.path),
            height: 300,
            width: 300,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Text(
              tc.text,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('choice');
            },
            child: Text("Choose Again"),
          ),
          ElevatedButton(
            onPressed: () async {
              await tc.getTranslation_papago();
              await tc.getTranslation_googleTranslator();
              Get.toNamed('result');
            },
            child: Text("Next Step"),
          ),
        ],
      ),
    );
  }
}
