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
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 20},
        {'texto': 'Verde', 'pontuacao': 30},
        {'texto': 'Branco', 'pontuacao': 40},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 20},
        {'texto': 'Elefante', 'pontuacao': 30},
        {'texto': 'Leão', 'pontuacao': 40},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'resposta': [
        {'texto': 'Maria', 'pontuacao': 10},
        {'texto': 'João', 'pontuacao': 20},
        {'texto': 'Leo', 'pontuacao': 30},
        {'texto': 'Pedro', 'pontuacao': 40},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  // metodo para reiniciar o questionario
  void _reiniciarQuestionario() {
    setState(() {
      // reiniciando as var de controle
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
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
