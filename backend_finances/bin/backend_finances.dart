import 'package:shelf/shelf.dart';

import 'api/accounts_api.dart';
import 'api/login_api.dart';
import 'core/custom_server.dart';
import 'core/middlewares/middleware_interception.dart';
import 'core/security/security_service_imp.dart';
import 'service/account_service.dart';
import 'utils/custom_env.dart';

void main() async {
  //CustomEnv.fromFile('.env-dev');
  var cascadeHandler = Cascade()
      .add(LoginApi(SecurityServiceImp()).handler)
      .add(AccountsApi(AccountService()).handler)
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
