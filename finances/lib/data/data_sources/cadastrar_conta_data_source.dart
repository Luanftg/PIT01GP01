import 'package:finances/domain/entities/conta_entity.dart';

abstract class CadastrarContaDataSource {
  Future<bool> call(Conta conta);
}
