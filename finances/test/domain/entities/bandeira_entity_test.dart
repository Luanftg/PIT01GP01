import 'package:finances/domain/entities/bandeira_entity.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Espero retornar uma instância válida de Bandeira', () {
    var bandeiraNuBank = Bandeira(
      nome: 'NuBank',
      caminhoDaFoto:
          'https://th.bing.com/th/id/R.839a6c9548a11d8478f081af9806b63c?rik=eUg6mqvejwgqWw&pid=ImgRaw&r=0',
    );

    expect(bandeiraNuBank, isNotNull);
  });
}
