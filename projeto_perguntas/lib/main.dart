import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

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

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': [
        'Preto',
        'Vermelho',
        'Verde',
        'Branco',
      ],
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

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  // corrigindo o erro de ter mais do que o numero de perguntas
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  // metodo que vai criar o widget
  @override
  Widget build(BuildContext context) {
    // usando o recurso .map para fazer uma lista de Widgets
    /*List<Widget> widgets =
        respostas.map((t) => Resposta(t, _responder)).toList();*/

    // forma "bruta" de fazer os widgets
    /*for (String textoResposta in respostas) {
      widgets.add(Resposta(textoResposta, _responder));
    }*/

    return MaterialApp(
      home: Scaffold(
        // Scaffold dara a estrutura da aplicação do widget
        appBar: AppBar(
          title: Text('Perguntas'),
          backgroundColor: Colors.red,
          centerTitle: true,
          shadowColor: Colors.white,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntasSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(),
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
