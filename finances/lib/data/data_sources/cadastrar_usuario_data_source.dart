import 'package:finances/domain/entities/usuario_entity.dart';

abstract class CadastrarUsuarioDatasource {
  Future<bool> call(Usuario usuario);
}
