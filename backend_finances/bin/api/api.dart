import 'package:shelf/shelf.dart';

import '../core/dependency_injector/dependency_injector.dart';
import '../core/security/security_service.dart';

abstract class Api {
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false});

  Handler createHandler({
    required Handler router,
    bool isSecurity = false,
    List<Middleware>? middlewares,
  }) {
    middlewares ??= [];

    var _securityService = DependencyInjector().get<SecurityService>();

    if (isSecurity) {
      middlewares.addAll(
        [
          _securityService.authorization,
          _securityService.verifyJWT,
        ],
      );
    }

    var pipe = Pipeline();

    middlewares.forEach((m) => pipe = pipe.addMiddleware(m));

    return pipe.addHandler(router);
  }
}
