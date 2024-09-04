import 'dart:convert';
import 'dart:io';

void main() async {
  await processarFaturamento('dados.json', 'json');

  await processarFaturamento('dados (2).xml', 'xml');
}

Future<void> processarFaturamento(String filePath, String fileType) async {
  List<double> faturamentoDiario = [];

  if (fileType == 'json') {
    final file = File(filePath);
    final contents = await file.readAsString();
    final List<dynamic> data = jsonDecode(contents);

    for (var dia in data) {
      if (dia['valor'] > 0) {
        faturamentoDiario.add(dia['valor']);
      }
    }
  } else if (fileType == 'xml') {
    final file = File(filePath);
    final contents = await file.readAsString();
    final rows = contents.split('<row>').skip(1);

    for (var row in rows) {
      final valorStart = row.indexOf('<valor>') + 7;
      final valorEnd = row.indexOf('</valor>');
      final valor = double.parse(row.substring(valorStart, valorEnd));
      if (valor > 0) {
        faturamentoDiario.add(valor);
      }
    }
  }

  if (faturamentoDiario.isEmpty) {
    print('nenhum valor de faturamento encontrado');
    return;
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

  print('nome do arquivo: $filePath');
  print('menor valor do faturamento: $menorFaturamento');
  print('maior valor do faturamento: $maiorFaturamento');
  print('dias do faturamento acima da media: $diasAcimaDaMedia');
}
