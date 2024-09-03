void main() {
  String original = "subi no onibus";
  String invertida = inverterString(original);

  print('palavra inicial: $original');
  print('palavra invertida: $invertida');
}

String inverterString(String str) {
  List<String> invertida = [];

  for (int i = str.length - 1; i >= 0; i--) {
    invertida.add(str[i]);
  }

  String resultado = '';
  for (int i = 0; i < invertida.length; i++) {
    resultado += invertida[i];
  }

  return resultado;
}
