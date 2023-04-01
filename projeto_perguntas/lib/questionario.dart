import './resposta.dart';
import './questao.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntasSelecionada;
  final void Function() quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntasSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntasSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntasSelecionada].cast()['resposta']
        : [];
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntasSelecionada]['texto'].toString()),
        ...respostas.map((t) => Resposta(t, quandoResponder)).toList(),
      ],
    );
  }
}
