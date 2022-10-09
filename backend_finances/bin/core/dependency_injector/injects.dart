import '../../api/accounts_api.dart';
import '../../api/login_api.dart';
import '../../models/account_model.dart';
import '../../service/account_service.dart';
import '../../service/generic_service.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector initialize() {
    var di = DependencyInjector();

    di.register<SecurityService>(() => SecurityServiceImp());

    di.register<LoginApi>(() => LoginApi(di.get()));
    di.register<GenericService<AccountModel>>(() => AccountService());
    di.register<AccountsApi>(() => AccountsApi(di.get()));

    return di;
  }
}
