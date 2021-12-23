import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<_PieData> pieData = [];
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      setState(() {
        pieData = [
          _PieData('Papago', (value.getInt('papago') ?? 1)),
          _PieData('Google', (value.getInt('google') ?? 1)),
          _PieData('Google cloud', (value.getInt('cloud') ?? 1)),
          _PieData('Kakao', (value.getInt('kakao') ?? 1))
        ];
        print("init is done");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Translator"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            if (pieData.isNotEmpty) ...{
              SfCircularChart(
                title: ChartTitle(text: 'Sales by sales person'),
                legend: Legend(isVisible: true),
                series: <PieSeries<_PieData, String>>[
                  PieSeries<_PieData, String>(
                      explode: true,
                      explodeIndex: 0,
                      dataSource: pieData,
                      xValueMapper: (_PieData data, _) => data.xData,
                      yValueMapper: (_PieData data, _) => data.yData,
                      dataLabelMapper: (_PieData data, _) => data.text,
                      dataLabelSettings: DataLabelSettings(isVisible: true)),
                ],
              ),
            },
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('choice');
              },
              child: Text("Translate"),
            ),
          ],
        ),
      ),
    );
  }
}

class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String? text;
}
