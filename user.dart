class User {
  String name;
  String email;
  String password;
  List<int> bpm;
  List<DateTime> bpm_ts;
  List<int> ecg;
  List<DateTime> ecg_ts;
  List<int> ir_val;
  List<int> red_val;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.bpm,
    required this.bpm_ts,
    required this.ecg,
    required this.ecg_ts,
    required this.ir_val,
    required this.red_val,
  });
}
