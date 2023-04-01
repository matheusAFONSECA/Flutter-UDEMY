import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto; // var aux

  // função que vai ser usada no evento do onPressed
  final void Function() quandoSelecionado;

  // construtor
  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // coloca o botão lá na main e pega um texto como parametro
      child: ElevatedButton(
        // aqui definimos o estilo do botao
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          onSurface: Colors.green,
          elevation: 20,
          shadowColor: Colors.red,
          // aqui muda o estilo do texto
          textStyle: TextStyle(
            color: Colors.white,
            wordSpacing: 10,
          ),
        ),

        child: Text(texto),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
