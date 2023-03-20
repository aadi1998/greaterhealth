// TODO Implement this library.
class EcgData {
  final double value;
   DateTime timeStamp;
  DateTime now = DateTime.now();
  double timestamp = now.microsecondsSinceEpoch.toDouble() / 1000000;
  EcgData(this.value, this.timeStamp);

  get ecgValue => null;
}