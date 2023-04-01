import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestioario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestioario);

  String get fraseResultado {
    if (pontuacao < 60) {
      return 'Parabéns!!!';
    } else if (pontuacao < 90) {
      return 'Você é bom';
    } else if (pontuacao < 120) {
      return 'Impressionante!';
    } else {
      return 'Nivel Jedi!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          widthFactor: double.infinity,
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 30),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestioario,
          child: Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 22,
              color: Colors.red,
              wordSpacing: 10,
            ),
          ),
        )
      ],
    );
  }
}
