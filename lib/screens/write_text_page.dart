import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hem_intership/controller/translation_controller.dart';

import 'home_page.dart';

class WriteTextPage extends StatefulWidget {
  @override
  _WriteTextPageState createState() => _WriteTextPageState();
}

class _WriteTextPageState extends State<WriteTextPage> {
  final myController = TextEditingController();
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
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: SizedBox(
              height: 600,
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write your sentence',
                ),
                controller: myController,
                expands: true,
                maxLines: null,
                minLines: null,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              tc.text = myController.text;
              await tc.getTranslation_papago();
              Get.toNamed('result');
            },
            child: Text("Next Step"),
          )
        ],
      ),
    );
  }
}
