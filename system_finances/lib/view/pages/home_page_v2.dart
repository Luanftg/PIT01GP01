import 'package:flutter/material.dart';
import 'package:system_finances/repositories/home_repository_imp.dart';
import 'package:system_finances/services/prefs_services.dart';
import 'package:system_finances/state/user_state.dart';
import 'package:system_finances/stores/user_store.dart';

import 'package:system_finances/view/widgets/custom_card_credit_widget.dart';

import '../components/home/custom_linear_home_contact.dart';
import '../widgets/custom_card_home_widget.dart';

class HomePageV2 extends StatefulWidget {
  const HomePageV2({Key? key}) : super(key: key);

  @override
  State<HomePageV2> createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2> {
  //final HomeController _controller = HomeController(HomeRepositoryImp());
  final UserStore _store = UserStore(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    //_controller.fetch();
    _store.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _store,
        builder: (context, state, _) {
          if (state is LoadindUserState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorUserState) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is SucessUserState) {
            return Scaffold(
              backgroundColor: Colors.white54,
              appBar: AppBar(
                toolbarHeight: 110,
                backgroundColor: Colors.green,
                title: CustomLinearContactWidget(
                  contactName: state.users.first.name,
                  pathContactImage: state.users.first.image,
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      PrefsService.logout();
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/login', (_) => true);
                    },
                    icon: const Icon(Icons.logout),
                    alignment: Alignment.topRight,
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomCardHomeWidget(
                        caminhoDaImagem: state.users.first.accountList.first
                            .bandeira.caminhoDaImagem,
                        nomeDaConta:
                            state.users.first.accountList.first.bandeira.nome,
                        tipoDeConta: 'Conta-Corrente',
                        saldo: state.users.first.accountList.first
                            .listaDeMovimentacao.first.valor),
                    const CustomCreditCard(),
                  ],
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                color: Colors.white,
                child: IconTheme(
                  data: const IconThemeData(color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.home),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.compare_arrows),
                        ),
                        FloatingActionButton.small(
                          backgroundColor: Colors.green,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          onPressed: (() {}),
                          child: const Icon(Icons.add),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bar_chart_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.settings),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        });
  }
}
