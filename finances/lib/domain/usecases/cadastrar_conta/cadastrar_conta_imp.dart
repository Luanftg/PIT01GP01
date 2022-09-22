import 'package:finances/domain/entities/conta_entity.dart';
import 'package:finances/domain/repositories/cadastrar_conta_repository.dart';
import 'package:finances/domain/usecases/cadastrar_conta/cadastrar_conta_use_case.dart';

class CadastrarContaImp implements CadastrarContaUseCase {
  final CadastrarContaRepository _cadastrarContaRepository;
  CadastrarContaImp(this._cadastrarContaRepository);

  @override
  Future<bool> call(Conta conta) async {
    return await _cadastrarContaRepository(conta);
  }
}
