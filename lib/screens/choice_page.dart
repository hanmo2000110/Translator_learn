import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hem_intership/controller/picture_controller.dart';
import 'package:hem_intership/controller/translation_controller.dart';

import 'home_page.dart';

class ChoicePage extends StatefulWidget {
  @override
  _ChoicePageState createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: () async {
                await pc.getImageFromCam();
                await tc.getImage(File(pc.image.path));
                await tc.getTextFromImage();
                Get.toNamed('take');
              },
              child: Text("Take Picture"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await pc.getImageFromGallery();
                await tc.getImage(File(pc.image.path));
                await tc.getTextFromImage();
                Get.toNamed('take');
              },
              child: Text("Choose Picture"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('write');
              },
              child: Text("Write Text"),
            ),
          ],
        ),
      ),
    );
  }
}
