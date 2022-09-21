import 'package:finances/domain/entities/usuario_entity.dart';

abstract class CadastrarUsuarioUseCase {
  Future<bool> call(Usuario novoUsuario);
}
