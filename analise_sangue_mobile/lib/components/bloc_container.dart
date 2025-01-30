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
}
