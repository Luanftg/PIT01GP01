import 'package:shelf/shelf.dart';

import 'api/accounts_api.dart';
import 'api/login_api.dart';
import 'core/custom_server.dart';
import 'core/dependency_injector/injects.dart';
import 'core/middlewares/middleware_interception.dart';

import 'utils/custom_env.dart';

void main() async {
  //CustomEnv.fromFile('.env-dev');

  final _di = Injects.initialize();

  var cascadeHandler = Cascade()
      .add(_di.get<LoginApi>().getHandler())
      .add(_di.get<AccountsApi>().getHandler(isSecurity: true))
      .handler;

  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middleware)
      .addHandler(cascadeHandler);

  await CustomServer().initialize(
    handler: handler,
    address: await CustomEnv.get<String>(key: 'address'),
    port: await CustomEnv.get<int>(key: 'port'),
  );
}
