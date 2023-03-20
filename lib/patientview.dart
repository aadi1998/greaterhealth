import 'package:flutter/material.dart';

class patientview extends StatelessWidget {
  @override
  final String URL = "http://68.183.205.184/index.php";

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
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child:
                    Image(image: AssetImage("assets/ecgimg.jpg"), height: 250)),
              ])
            ])));
  }
}