import 'package:finances/domain/entities/movimentacao_entity.dart';
import 'package:finances/domain/repositories/cadastrar_movimentacao_repository.dart';
import 'package:finances/domain/usecases/cadastrar_movimentacao/cadastrar_movimentacao_use_case.dart';

class CadastrarMovimentacaoImp implements CadastrarMovimentacaoUseCase {
  final CadastrarMovimentacaoRepository _cadastrarMovimentacaoRepository;
  CadastrarMovimentacaoImp(this._cadastrarMovimentacaoRepository);

  @override
  Future<bool> call(Movimentacao movimentacao) async {
    return await _cadastrarMovimentacaoRepository(movimentacao);
  }
}
