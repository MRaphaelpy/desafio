void main() {
  int n = 4;
  if (fibonaci(n)) {
    print('$n pertence a sequencia');
  } else {
    print('$n nao pertence a sequencia');
  }
}

bool fibonaci(int n) {
  if (n < 0) return false;
  if (n == 0 || n == 1) return true;
  int numeroInicial1 = 0;
  int numeroInicial2 = 1;
  int numeroN = numeroInicial1 + numeroInicial2;

  while (numeroN <= n) {
    if (numeroN == n) return true;
    numeroInicial1 = numeroInicial2;
    numeroInicial2 = numeroN;
    numeroN = numeroInicial1 + numeroInicial2;
  }
  return false;
}
