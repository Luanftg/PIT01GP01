import 'package:finances/domain/entities/usuario_entity.dart';

abstract class CadastrarUsuarioRepository {
  Future<bool> call(Usuario usuario);
}
