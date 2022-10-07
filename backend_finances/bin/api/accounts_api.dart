// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/account_model.dart';
import '../service/generic_service.dart';

class AccountsApi {
  final GenericService<AccountModel> _service;

  AccountsApi(this._service);

  Handler get handler {
    Router router = Router();

    router.get('/accounts', (Request req) {
      List<AccountModel> accounts = _service.findAll();
      List<Map> accountsMap = accounts.map((e) => e.toMap()).toList();
      return Response.ok(jsonEncode(accountsMap));
    });

    router.post('/accounts', (Request req) async {
      var body = await req.readAsString();
      _service.save(AccountModel.fromJson(jsonDecode(body)));
      return Response(201);
    });

    router.put('/accounts', (Request req) {
      String? id = req.url.queryParameters['id'];
      //_service.save('');
      return Response.ok('Atualizou a rota [account]');
    });

    router.delete('/accounts', (Request req) {
      String? id = req.url.queryParameters['id'];
      //_service.delete(id);
      return Response.ok('Deletou a rota [account]');
    });

    return router;
  }
}
