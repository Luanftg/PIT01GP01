import 'package:finances/domain/entities/bandeira_entity.dart';
import 'package:finances/domain/entities/cartao_entity.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Espero retornar uma instância válida de Cartão', () {
    var bandeiraNuBank = Bandeira(
      nome: 'NuBank',
      caminhoDaFoto:
          'https://th.bing.com/th/id/R.839a6c9548a11d8478f081af9806b63c?rik=eUg6mqvejwgqWw&pid=ImgRaw&r=0',
    );
    var cartaoNuBank = Cartao(saldo: 0, bandeira: bandeiraNuBank);

    expect(cartaoNuBank, isNotNull);
  });

  test('Espero atribuição do parametro criadoEm pelo construtor', () {
    var bandeiraNuBank = Bandeira(
      nome: 'NuBank',
      caminhoDaFoto:
          'https://th.bing.com/th/id/R.839a6c9548a11d8478f081af9806b63c?rik=eUg6mqvejwgqWw&pid=ImgRaw&r=0',
    );
    var cartaoNuBank = Cartao(saldo: 0, bandeira: bandeiraNuBank);

    expect(cartaoNuBank.criadoEm.runtimeType, DateTime);
  });
}
