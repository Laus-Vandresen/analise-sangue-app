import 'package:flutter/material.dart';

abstract class BlocContainer extends StatelessWidget {
  const BlocContainer({super.key});

  void push(BuildContext blocContext, BlocContainer container) {
    Navigator.of(blocContext).push(MaterialPageRoute(
      builder: (context) => container,
    ));
  }

  void pushAndRemoveUntil(BuildContext blocContext, BlocContainer container) {
    Navigator.of(blocContext).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => container),
      (route) => false,
    );
  }

  // void showSuccessToastr(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     backgroundColor: Colors.green,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
  // }
  //
  // void showWarningToastr(String? message) {
  //   Fluttertoast.showToast(
  //     msg: message ?? '',
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     backgroundColor: Colors.orange,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
  // }
}
