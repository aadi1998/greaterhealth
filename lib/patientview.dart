import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'EcgData.dart';

class patientview extends StatelessWidget {
  final String URL = "http://68.183.205.184/index.php";
  //static final List<EcgData> ecgData = ecgData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient View"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
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
                  ),
                ),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: AssetImage("assets/ecgimg.jpg"),
                    height: 250,
                  ),
                ),
                Expanded(
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                  series: <LineSeries>[
                      LineSeries<EcgData, String>(
                        dataSource: ecgData,
                       xValueMapper: (EcgData ecg, _) => ecg.timestamp,
                        yValueMapper: (EcgData ecg, _) => ecg.ecgValue,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
   );
    }
}
