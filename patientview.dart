import 'package:flutter/material.dart';
import 'package:greaterhealth/main.dart';
import 'LoginPage.dart';
import 'user.dart';
import 'package:http/http.dart' as http;
import 'package:mysql1/mysql1.dart';
import 'package:charts_flutter/flutter.dart' as charts;
final String URL = "http://68.183.205.184/index.php";
class ECGChart extends StatelessWidget {
  final List<int> ecgData;
  final List<DateTime> ecgTimestamps;

  ECGChart({required this.ecgData, required this.ecgTimestamps});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<EcgDataPoint, DateTime>> seriesList = [
      charts.Series<EcgDataPoint, DateTime>(
        id: 'ECG',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (datum, _) => datum.time,
        measureFn: (datum, _) => datum.value,
        data: List.generate(
          ecgData.length,
              (i) => EcgDataPoint(
            time: ecgTimestamps[i],
            value: ecgData[i].toDouble(),
          ),
        ),
      ),
    ];

    return SizedBox(
      height: 200.0,
      child: charts.TimeSeriesChart(
        seriesList,
        animate: true,
        primaryMeasureAxis: charts.NumericAxisSpec(
          tickProviderSpec: charts.BasicNumericTickProviderSpec(
            zeroBound: false,
            dataIsInWholeNumbers: false,
            desiredMaxTickCount: 4,
            desiredTickCount: 4,
            desiredMinTickCount: 4,
          ),
        ),
        domainAxis: charts.DateTimeAxisSpec(
          tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
            day: charts.TimeFormatterSpec(
              format: 'd',
              transitionFormat: 'MM/dd',
            ),
            hour: charts.TimeFormatterSpec(
              format: 'H',
              transitionFormat: 'MM/dd H',
            ),
            minute: charts.TimeFormatterSpec(
              format: 'm',
              transitionFormat: 'MM/dd H:m',
            ),
          ),
        ),
      ),
    );
  }
}

class EcgDataPoint {
  final DateTime time;
  final double value;

  EcgDataPoint({required this.time, required this.value});
}
class PatientView extends StatefulWidget {
  final User user;

  PatientView({required this.user});

  @override
  _PatientViewState createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  late List<EcgDataPoint> _ecgDataPoints;


  @override
  void initState() {
    super.initState();
    _ecgDataPoints = _generateEcgDataPoints(widget.user.ecg, widget.user.ecg_ts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient View"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ECGChart(
              ecgData: widget.user.ecg,
              ecgTimestamps: widget.user.ecg_ts,
            ),
          ),
        ],
      ),
    );
  }

  List<EcgDataPoint> _generateEcgDataPoints(List<int> ecgData, List<DateTime> ecgTimestamp) {
    List<EcgDataPoint> ecgDataPoints = [];
    for (int i = 0; i < ecgData.length; i++) {
      ecgDataPoints.add(EcgDataPoint(time: ecgTimestamp[i], value: ecgData[i].toDouble()));
    }
    return ecgDataPoints;
  }
}
