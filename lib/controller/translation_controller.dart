import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:google_translator/google_translator.dart';

class TranslationController extends GetxController {
  String text = "";
  String language = "";
  String result_papago = "";
  String result_cloud_google = "";
  late GoogleVisionImage visionImage;
  TextRecognizer textRecognizer = GoogleVision.instance.textRecognizer();
  late VisionText visionText;

  int getImage(File file) {
    visionImage = GoogleVisionImage.fromFile(file);
    return 0;
  }

  Future<void> getTextFromImage() async {
    visionText = await textRecognizer.processImage(visionImage);
    text = visionText.text!;
  }

  Future<void> getLanguage_papago() async {
    String _client_id = "EGqjWCF_9f7YejFlKWiG";
    String _client_secret = "QBnTUbwRS5";
    String _content_type = "application/x-www-form-urlencoded; charset=UTF-8";
    String _url = "https://openapi.naver.com/v1/papago/detectLangs";

    http.Response lan = await http.post(Uri.parse(_url), headers: {
      // 'query': text,
      'Content-Type': _content_type,
      'X-Naver-Client-Id': _client_id,
      'X-Naver-Client-Secret': _client_secret
    }, body: {
      'query': text
    });
    if (lan.statusCode == 200) {
      var dataJson = jsonDecode(lan.body);
      language = dataJson['langCode'];
      print(language);
    } else {
      print(lan.statusCode);
    }
  }

  Future<void> getTranslation_papago() async {
    String _client_id = "F7Ie6p98obcphDLwv3xG";
    String _client_secret = "cZxq9zLhJC";
    String _content_type = "application/x-www-form-urlencoded; charset=UTF-8";
    String _url = "https://openapi.naver.com/v1/papago/n2mt";
    await getLanguage_papago();
    print(text);
    http.Response trans = await http.post(
      Uri.parse(_url),
      headers: {
        // 'query': text,
        'Content-Type': _content_type,
        'X-Naver-Client-Id': _client_id,
        'X-Naver-Client-Secret': _client_secret
      },
      body: {
        'source': language,
        'target': "ko",
        'text': text,
      },
    );
    if (trans.statusCode == 200) {
      var dataJson = jsonDecode(trans.body);
      result_papago = dataJson['message']['result']['translatedText'];
    } else {
      print(trans.statusCode);
    }
  }

  Future<void> getTranslation_googleTranslator() async {
    result_cloud_google = text;
  }

  Future<void> getTranslation_google_cloud_translation() async {
    var _baseUrl = 'translate.googleapis.com';
    final _path = '/translate_a/single';

    // var response = await http.post();

    // if (response.statusCode == 200) {
    //   print("");
    // } else {
    //   print("");
    // }
  }
}

// https://cloud.google.com/translate/docs/basic/quickstart#translate_translate_text-nodejs
