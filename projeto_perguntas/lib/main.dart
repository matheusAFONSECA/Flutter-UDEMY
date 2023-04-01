import 'package:flutter/material.dart';

// modo 'correto' do flutter de iniciar o app
main() => runApp(PerguntaApp());
/*
-> A classe que esta dentro dos parenteses do runApp(Classe_aqui_dentro)
vai ser a raiz que compôe o App que estamos criando, ou seja, será o ponto
de partida de onde o nosso app vai funcionar
-> Ao salvarmos o  arquivo em que estamos modificando o projeto em tempo real
as modificações são feitas no app
*/

// vamos criar um widget
class PerguntaApp extends StatelessWidget {
  /*
  -> Esse StatelessWidget é que faz a classe PerguntaApp se tornar um Widget
  */

  var perguntaSelecionada = 0;

  // criando um metodo que responde à ação de clicar no botão
  void responder() {
    perguntaSelecionada++;
    print(perguntaSelecionada);
  }

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
          Text(perguntas[perguntaSelecionada]),
          ElevatedButton(
            child: Text('PERGUNTA 1'),
            onPressed: responder,
          ),
          ElevatedButton(child: Text('PERGUNTA 2'), onPressed: responder),
          ElevatedButton(
            child: Text('PERGUNTA 3'),
            onPressed: responder,
          ),
        ]),
      ),
    );
  }
}
