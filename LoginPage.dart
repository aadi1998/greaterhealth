import 'package:flutter/material.dart';
import 'package:greaterhealth/EcgData.dart';
import 'package:mysql1/mysql1.dart';
import 'user.dart';
import 'dart:core';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'patientview.dart';
final String URL = "http://68.183.205.184/index.php";

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key,
    required this.title,
    required this.usernameController,
    required this.ecg_data,
    required this.ecg_timestamps,
  }) : super(key: key);

  final String title;
  final TextEditingController usernameController;
  final List<int> ecg_data;
  final List<DateTime> ecg_timestamps;


  @override
  _LoginPageState createState() => _LoginPageState();
}

class ECGChart extends StatelessWidget {

  final List<int> ecg;
  final List<DateTime> ecg_ts;

  ECGChart(
      {required this.ecg, required this.ecg_ts});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<dynamic, DateTime>> seriesList = [
      charts.Series<dynamic, DateTime>(
          id: 'ECG',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (datum, _) => datum.time,
          measureFn: (datum, _) => datum.value,
        data: List.generate(ecg.length, (i) => {'time': ecg_ts[i], 'value': ecg[i]}),
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


class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  User? user;
  int i = 0;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _attemptLogin(String name, String password, String email) async {
    try {
      final response = await http.post(
        Uri.parse(URL),
        body: {'username': name, 'password': password, 'email': email},
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (result != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(result['message'])));
          print(result['message']);

          if (result['message'] == 'Successfully logged in') {
            String uname = result['username'];
            String eemail = result['email'];
            String pwd = result['password'];

            List<int> bpm = parseIntArray(result['bpm_data']);
            List<DateTime> bpm_time = parseTimestamps(result['bpm_timestamp']);

            List<int> ecg = parseIntArray(result['ecg_data']);
            List<DateTime> ecg_time = parseTimestamps(result['ecg_timestamp']);

            List<int> red_value = parseIntArray(result['ir_value']);
            List<int> ir_value = parseIntArray(result['red_value']);

            // create user object
            User user = User(
              name: uname,
              email: eemail,
              password: pwd,
              bpm: bpm ?? [],
              bpm_ts: bpm_time ?? [],
              ecg: ecg ?? <int>[],
              ecg_ts: ecg_time ?? <DateTime>[],
              ir_val: ir_value ?? [],
              red_val: red_value ?? [],
            );

            print(user.name);
            print(user.email);
            print(user.password);
            print(user.bpm);
            print(user.bpm_ts);
            print(user.ecg);
            print(user.ecg_ts);
            print(user.ir_val);
            print(user.red_val);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PatientView(user: user)),

            );
          } else {
            print("no");
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Unable to retrieve any data from server")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${response.statusCode}")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  _onSignInButtonPressed() async {
    await _attemptLogin(_nameController.text, _passwordController.text, "");
  }

  void _onRegisterButtonPressed() async {
    if (i == 0) {
      setState(() {
        i = 1;
      });
    } else {
      setState(() {
        i = 0;
      });

      await _attemptLogin(_nameController.text, _passwordController.text,
          _emailController.text);
    }
  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Enter Password',
              ),
            ),
            Visibility(
              visible: i == 1,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _onSignInButtonPressed,
              // onPressed: () {
              //   _onSignInButtonPressed;
              // },
              child: Text("Sign In"),
            ),
            ElevatedButton(
              onPressed: _onRegisterButtonPressed,
              child: Text(i == 0 ? "Register" : "CREATE ACCOUNT"),
            ),

              ECGChart(ecg: user?.ecg ?? [], ecg_ts: user?.ecg_ts ?? [])

          ],
        ),
      ),
    );
  }

  List<int> parseIntArray(String input) {
    List<String> parts = input.split(',');
    List<int> result = [];

    for (String part in parts) {
      if (part.trim().isNotEmpty) {
        result.add(int.parse(part.trim()));
      }
    }

    return result;
  }

  List<DateTime> parseTimestamps(String input) {
    List<String> parts = input.split(',');
    List<DateTime> result = [];

    for (String part in parts) {
      if (part.trim().isNotEmpty) {
        result.add(DateTime.parse(part.trim()));
      }
    }

    return result;
  }

  patientview({required User user, required List<int> ecgData, required ecgTimestamps}) {}
}
