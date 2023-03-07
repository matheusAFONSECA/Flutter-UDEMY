main() {
  var a = 3;
  a = 4;

  final b = 3; // não é possivel mudar esse valor para a var b
  // b = 6;

  const c =
      5; // melhor compilação usa-se o 'const' e para run time usamos o 'final'
  // c = 7;
}
