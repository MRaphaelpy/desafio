void main() {
  double sp = 67836.43;
  double rj = 36678.66;
  double mg = 29229.88;
  double es = 27165.48;
  double outros = 19849.53;

  double total = sp + rj + mg + es + outros;

  double percentualSP = (sp / total) * 100;
  double percentualRJ = (rj / total) * 100;
  double percentualMG = (mg / total) * 100;
  double percentualES = (es / total) * 100;
  double percentualOutros = (outros / total) * 100;

  print('percentual por estado:');
  print('sp: ${percentualSP.toStringAsFixed(2)}%');
  print('rj: ${percentualRJ.toStringAsFixed(2)}%');
  print('mg: ${percentualMG.toStringAsFixed(2)}%');
  print('es: ${percentualES.toStringAsFixed(2)}%');
  print('outros: ${percentualOutros.toStringAsFixed(2)}%');
}
