import 'package:finances/data/data_sources/cadastrar_movimentacao_data_source.dart';
import 'package:finances/domain/entities/movimentacao_entity.dart';
import 'package:finances/domain/repositories/cadastrar_movimentacao_repository.dart';

class CadastrarMovimentacaoRepositoryImp
    implements CadastrarMovimentacaoRepository {
  final CadastrarMovimentacaoDatasource _cadastrarMovimentacaoDatasource;
  CadastrarMovimentacaoRepositoryImp(this._cadastrarMovimentacaoDatasource);
  @override
  Future<bool> call(Movimentacao movimentacao) async {
    return await _cadastrarMovimentacaoDatasource(movimentacao);
  }
}
