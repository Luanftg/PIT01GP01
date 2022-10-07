import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class AccountsApi {
  Handler get handler {
    Router router = Router();

    router.get('/accounts', (Request req) {
      return Response.ok('Acessou a rota [account]');
    });

    router.post('/accounts', (Request req) {
      return Response.ok('Postou na rota [account]');
    });

    router.put('/accounts', (Request req) {
      String? id = req.url.queryParameters['id'];

      return Response.ok('Atualizou a rota [account]');
    });

    router.delete('/accounts', (Request req) {
      String? id = req.url.queryParameters['id'];
      return Response.ok('Deletou a rota [account]');
    });

    return router;
  }
}
