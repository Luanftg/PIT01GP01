import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class AccountsApi {
  Handler get handler {
    Router router = Router();

    router.get('/accounts', (Request req) {
      return Response.ok('Acessou a rota [account]');
    });

    return router;
  }
}
