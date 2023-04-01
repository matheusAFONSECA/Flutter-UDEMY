import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        widthFactor: double.infinity,
        child: Text(
          "Parabéns!!!",
          style: TextStyle(
            fontSize: 35,
          ),
        ),
      ),
    );
  }
}
