import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  const Utils._();

  static void displayToastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
