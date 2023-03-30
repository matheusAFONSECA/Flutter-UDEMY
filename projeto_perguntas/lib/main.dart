import 'package:flutter/material.dart';

// modo 'correto' do flutter de iniciar o app
main() => runApp(PerguntaApp());
/*
-> A classe que esta dentro dos parenteses do runApp(Classe_aqui_dentro)
vai ser a raiz que compôe o App que estamos criando, ou seja, será o ponto
de partida de onde o nosso app vai funcionar
*/

// vamos criar um widget
class PerguntaApp extends StatelessWidget {
  /*
  -> Esse StatelessWidget é que faz a classe PerguntaApp se tornar um Widget
  */

  // metodo que vai criar o widget
  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];

    return MaterialApp(
      home: Scaffold(
        // Scaffold dara a estrutura da aplicação do widget
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(children: <Widget>[
          Text(perguntas[0]),
          ElevatedButton(
            child: Text('PERGUNTA 1'),
            onPressed: null,
          ),
          ElevatedButton(
            child: Text('PERGUNTA 2'),
            onPressed: null,
          ),
          ElevatedButton(
            child: Text('PERGUNTA 3'),
            onPressed: null,
          ),
        ]),
      ),
    );
  }
}
