import 'package:finances/data/data_sources/cadastrar_conta_data_source.dart';
import 'package:finances/domain/entities/conta_entity.dart';
import 'package:finances/domain/repositories/cadastrar_conta_repository.dart';

class CadastrarContaRepositoryImp implements CadastrarContaRepository {
  final CadastrarContaDataSource _cadastrarContaDataSource;
  CadastrarContaRepositoryImp(this._cadastrarContaDataSource);

  @override
  Future<bool> call(Conta conta) {
    return _cadastrarContaDataSource(conta);
  }
}
