import 'dart:math';

final Map<String, List> checkbox={
    "Maiúsculas (ABC)":[ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'],
    "Minúsculas (abc)":[ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'],
    "Caracteres especiais (.!%)":['!', '@', '#', '\$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+', '[', ']', '{', '}', '\\', '|', ';', ':', '\'', '"', ',', '.', '<', '>', '/', '?', '`', '~'],
    "Números (123)":["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
};

randomValue(List values, {double? sizePass}) {//Gerro valores aleatorios com base na lista recebida concatenada dos valores e gero com base no tamanho passado
  List pass=[];
  for (var i = 0; i < (sizePass??12); i++) {//o 12 é o tamanho fixo
    var valor=Random().nextInt(values.length);
    pass.add(values[valor]);
  }
  
  return pass;
}