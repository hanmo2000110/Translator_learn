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
  String result_kakao = "";
  String from = 'en';
  String to = 'ko';
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
    } else {
      print("papago_checklang");
      print(lan.statusCode);
    }
  }

  Future<void> getTranslation_papago() async {
    String _client_id = "F7Ie6p98obcphDLwv3xG";
    String _client_secret = "cZxq9zLhJC";
    String _content_type = "application/x-www-form-urlencoded; charset=UTF-8";
    String _url = "https://openapi.naver.com/v1/papago/n2mt";
    await getLanguage_papago();

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
      print("papago_trans");
      print(trans.statusCode);
      result_papago = text;
    }
  }

  Future<void> getTranslation_googleTranslator() async {
    result_cloud_google = text;
  }

  Future<void> getTranslation_google_cloud_translation() async {
    var _baseUrl = 'https://translation.googleapis.com/language/translate/v2';
    var key = 'AIzaSyBgQdD1yHaoyBWNqWPoNsEFEZoz2y8kjMw';
    var response = await http.post(
      Uri.parse('$_baseUrl?target=$to&key=$key&q=$text'),
    );

    if (response.statusCode == 200) {
      var dataJson = jsonDecode(response.body);
      result_cloud_google =
          dataJson['data']['translations'][0]['translatedText'];
    } else {
      print("google");
      print(response.statusCode);
    }
  }

  Future<void> getTranslation_kakao() async {
    var _baseUrl = 'https://dapi.kakao.com/v2/translation/translate';
    var key = '8563a5ffea30b574d2581a94f0d8669e';
    var too = "kr";
    var fromm = "en";
    var response = await http.post(
      Uri.parse(_baseUrl),
      headers: ({
        'Authorization': 'KakaoAK $key',
        'Content-type': "application/x-www-form-urlencoded; charset=UTF-8",
      }),
      body: ({
        'src_lang': fromm,
        'target_lang': too,
        'query': text,
      }),
    );

    if (response.statusCode == 200) {
      var dataJson = jsonDecode(response.body);
      result_kakao = dataJson['translated_text']
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '');
    } else {
      print(response.statusCode);
    }
  }
}
