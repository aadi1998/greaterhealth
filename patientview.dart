import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'EcgData.dart';

class patientview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Patient View"),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Column(children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome User",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Text(
                  "Heart Rate",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Spacer(),
                Text(
                  "Daily Average",
                  style: TextStyle(
                    color: Colors.cyan,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.cyan,
                )
              ],
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: AssetImage("assets/bpm.jpg"),
                  height: 250,
                )),
            Row(
              children: const [
                Text(
                  "Electrocardiogram",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Spacer(),
                Text(
                  "Daily Average",
                  style: TextStyle(
                    color: Colors.cyan,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.cyan,
                )
              ],
            ),
            SfCartesianChart(
              zoomPanBehavior: ZoomPanBehavior(
                enablePinching: true,
                enablePanning: true,
              ),
              primaryXAxis: DateTimeAxis(
                majorGridLines: MajorGridLines(width: 0),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                intervalType: DateTimeIntervalType.milliseconds,
                interval: 500,
              ),
              primaryYAxis: NumericAxis(
                labelFormat: '{value}',
                axisLine: AxisLine(width: 0),
                majorTickLines: MajorTickLines(width: 0),
              ),
              series: <ChartSeries>[
                LineSeries<EcgData, DateTime>(
                  dataSource: <EcgData>[
                  ],
                  xValueMapper: (EcgData ecgData, _) => ecgData.timeStamp,
                  yValueMapper: (EcgData ecgData, _) => ecgData.ecgValue,
                )
              ],
            )
            /*
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child:
                    Image(image: AssetImage("assets/ecgimg.jpg"), height: 250)),
         */

          ])
        ])));
  }
}
