import 'package:shelf/shelf.dart';

class MiddlewareInterception {
  Middleware get middleware {
    return createMiddleware(
      responseHandler: (Response res) => res.change(
        headers: {"content-type": "application/json"},
      ),
    );
  }
}
