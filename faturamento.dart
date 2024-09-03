import 'dart:convert';
import 'dart:io';

void main() async {
  final file = File("faturamento.json");
  final contents = await file.readAsString();
  final List<dynamic> data = jsonDecode(contents);

  List<double> faturamentoDiario = [];
  for (var dia in data) {
    if (dia['valor'] > 0) {
      faturamentoDiario.add(dia['valor']);
    }
  }

  double menorFaturamento = faturamentoDiario[0];
  for (var valor in faturamentoDiario) {
    if (valor < menorFaturamento) {
      menorFaturamento = valor;
    }
  }

  double maiorFaturamento = faturamentoDiario[0];
  for (var valor in faturamentoDiario) {
    if (valor > maiorFaturamento) {
      maiorFaturamento = valor;
    }
  }

  double somaFaturamento = 0;
  for (var valor in faturamentoDiario) {
    somaFaturamento += valor;
  }
  double mediaMensal = somaFaturamento / faturamentoDiario.length;

  int diasAcimaDaMedia = 0;
  for (var valor in faturamentoDiario) {
    if (valor > mediaMensal) {
      diasAcimaDaMedia++;
    }
  }

  print('menor valor de faturamento: $menorFaturamento');
  print('maior valor de faturamento: $maiorFaturamento');
  print('dias com faturamento acima da media: $diasAcimaDaMedia');
}
