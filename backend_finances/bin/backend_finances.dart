import 'package:shelf/shelf.dart';

import 'api/accounts_api.dart';
import 'api/login_api.dart';
import 'core/custom_server.dart';
import 'service/account_service.dart';
import 'utils/custom_env.dart';

void main() async {
  //CustomEnv.fromFile('.env-dev');
  var cascadeHandler = Cascade()
      .add(LoginApi().handler)
      .add(AccountsApi(AccountService()).handler)
      .handler;

  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  await CustomServer().initialize(
    handler: handler,
    address: await CustomEnv.get<String>(key: 'address'),
    port: await CustomEnv.get<int>(key: 'port'),
  );
}
