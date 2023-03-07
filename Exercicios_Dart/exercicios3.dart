main() {
  // lista
  Set<int> conjunto = {0, 1, 2, 3, 4, 4, 4, 4};

  print(conjunto.length);
  print(conjunto is Set);

  //dinamico -> fracamente tipada
  dynamic x = 'Teste';
  x = 123;
  x = false;

  print(x);

  // mapa -> fortemente tipada -> mais usadas
  Map<String, double> notasDosAlunos = {
    'Ana': 9.7,
    'Bia': 9.2,
    'Carlos': 7.8,
  };

  for (var chave in notasDosAlunos.keys) {
    print('Chave = $chave');
  }

  for (var valor in notasDosAlunos.values) {
    print('valor = $valor');
  }

  for (var registro in notasDosAlunos.entries) {
    print('${registro.key} = ${registro.value}');
  }
}
