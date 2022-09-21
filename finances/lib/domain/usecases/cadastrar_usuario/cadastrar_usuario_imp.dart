import 'package:finances/domain/usecases/cadastrar_usuario/cadastrar_usuario_use_case.dart';
import 'package:finances/domain/entities/usuario_entity.dart';
import 'package:finances/domain/repositories/cadastrar_usuario_repository.dart';

class CadastrarUsuarioImp implements CadastrarUsuarioUseCase {
  final CadastrarUsuarioRepository _cadastrarUsuarioRepository;
  CadastrarUsuarioImp(this._cadastrarUsuarioRepository);

  @override
  Future<bool> call(Usuario novoUsuario) async {
    return await _cadastrarUsuarioRepository(novoUsuario);
  }
}
