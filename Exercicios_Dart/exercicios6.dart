imprimirProduto({String nome = 'padrao', double preco = 9.99}) {
  print("O produto ${nome} tem preco R\$${preco}!!!!");
}

// criando uma classe
class Produto {
  late String nome;
  late double preco;

  // construtor
  Produto({this.nome = 'padrao', this.preco = 9.99}); // -> parâmetro nomeado

  //Produto(String nome, double preco) {
  //this.nome = nome;
  //this.preco = preco;
  //}
}

main() {
  var p1 = new Produto(nome: 'Lapis', preco: 4.99);
  var p2 = new Produto(preco: 1459.99, nome: 'Geladeira');
  //p1.nome = 'Lapis';
  //p1.preco = 4.59;

  // print('O produto ${p1.nome} tem preço de R\$${p1.preco}');
  // print('O produto ${p2.nome} tem preço de R\$${p2.preco}');

  imprimirProduto(nome: p1.nome, preco: p1.preco);
  imprimirProduto(preco: p2.preco, nome: p2.nome);
}

/*
-> Podemos misturar parâmetros posicionais e nomeados para termos 
algo mais dinâmico em flutter
*/
