import '../models/account_model.dart';
import 'generic_service.dart';
import '../utils/list_extension.dart';

class AccountService implements GenericService<AccountModel> {
  final List<AccountModel> _fakeDB = [];
  @override
  bool delete(int id) {
    _fakeDB.removeWhere((e) => e.id == id);
    return true;
  }

  @override
  List<AccountModel> findAll() {
    return _fakeDB;
  }

  @override
  AccountModel findOne(int id) {
    return _fakeDB.firstWhere((e) => e.id == id);
  }

  @override
  bool save(AccountModel value) {
    AccountModel? account = _fakeDB.firstWhereOrNull((e) => e.id == value.id);
    if (account == null) {
      _fakeDB.add(value);
    } else {
      var index = _fakeDB.indexOf(account);
      _fakeDB[index] = value;
    }
    return true;
  }
}
