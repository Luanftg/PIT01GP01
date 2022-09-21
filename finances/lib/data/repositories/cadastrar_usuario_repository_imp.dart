import 'package:finances/data/data_sources/cadastrar_usuario_data_source.dart';
import 'package:finances/domain/entities/usuario_entity.dart';
import 'package:finances/domain/repositories/cadastrar_usuario_repository.dart';

class CadastrarUsuarioRepositoryImp implements CadastrarUsuarioRepository {
  final CadastrarUsuarioDatasource _cadastrarUsuarioDatasource;
  CadastrarUsuarioRepositoryImp(this._cadastrarUsuarioDatasource);
  @override
  Future<bool> call(Usuario usuario) async {
    return await _cadastrarUsuarioDatasource(usuario);
  }
}
