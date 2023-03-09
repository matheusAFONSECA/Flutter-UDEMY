import 'package:flutter/material.dart';

main() {
  runApp(new PerguntaApp());
}

// vamos criar um widget
class PerguntaApp extends StatelessWidget {
  /*
  -> Esse StatelessWidget é que faz a classe PerguntaApp se tornar um Widget
  */

  // metodo que vai criar o widget
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text('Olá Flutter!!!'),
    );
  }
}
