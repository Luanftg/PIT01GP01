class ValorFuturo {
  double valorFuturoAportesMensais;
  double valorFuturoAporteInicial;
  double totalValorFuturo;
  double rendimentoTotal;
  ValorFuturo({
    required this.valorFuturoAportesMensais,
    required this.valorFuturoAporteInicial,
    required this.totalValorFuturo,
    required this.rendimentoTotal,
  });

  @override
  String toString() {
    return 'ValorFuturo(valorFuturoAportesMensais: $valorFuturoAportesMensais, valorFuturoAporteInicial: $valorFuturoAporteInicial, totalValorFuturo: $totalValorFuturo, rendimentoTotal: $rendimentoTotal)';
  }
}
