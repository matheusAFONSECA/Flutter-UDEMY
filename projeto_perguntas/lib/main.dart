import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

// modo 'correto' do flutter de iniciar o app
main() => runApp(PerguntaApp());

/*
-> A classe que esta dentro dos parenteses do runApp(Classe_aqui_dentro)
vai ser a raiz que compôe o App que estamos criando, ou seja, será o ponto
de partida de onde o nosso app vai funcionar
-> Ao salvarmos o  arquivo em que estamos modificando o projeto em tempo real
as modificações são feitas no app
-> Quando colocamos o _ na frente de uma variável ou classe, fazemos com que
esse atributo se torne privado.
      -> isso é uma grande diferença do Dart e outras linguagens
*/

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  // metodo que vai criar o widget
  @override
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'resposta': ['Preto', 'Vermelho', 'Verde', 'Brsnco'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'resposta': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'resposta': ['Maria', 'João', 'Leo', 'Pedro'],
      }
    ];

    // fazendo uma lista de Widgets de respostas para colocarmos no botão
    List<Widget> respostas = [];

    for (String textoResposta
        in perguntas[_perguntaSelecionada].cast()['resposta']) {
      respostas.add(Resposta(textoResposta, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        // Scaffold dara a estrutura da aplicação do widget
        appBar: AppBar(
          title: Text('Perguntas'),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas,
          ],
        ),
      ),
    );
  }
}

// vamos criar um widget
class PerguntaApp extends StatefulWidget {
  // com isso conseguimos converter um widget de Stateless para Stateful
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
