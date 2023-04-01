import './resposta.dart';
import './questao.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntasSelecionada;
  final void Function(int) quandoResponder;

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
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntasSelecionada].cast()['resposta']
            as List<Map<String, Object>>
        : [];
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntasSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'] as String,
            () => quandoResponder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
