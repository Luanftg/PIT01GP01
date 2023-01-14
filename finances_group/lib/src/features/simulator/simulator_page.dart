import 'package:finances_group/src/data/services/auth.service.dart';
import 'package:finances_group/src/features/simulator/simulator_controller.dart';
import 'package:finances_group/src/features/simulator/simulator_repository._imp.dart';
import 'package:finances_group/src/features/simulator/simulator_state.dart';
import 'package:finances_group/src/shared/design/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../../models/valor_futuro.dart';
import '../../models/valor_simulado.dart';
import '../../shared/design/colors/app_custom_colors.dart';

class SimulatorPage extends StatefulWidget {
  const SimulatorPage({super.key});

  @override
  State<SimulatorPage> createState() => _SimulatorPageState();
}

class _SimulatorPageState extends State<SimulatorPage> {
  final SimulatorController _simulatorController =
      SimulatorController(SimulatorRepositoryImp(), AuthService());

  double get riskValue => _simulatorController.riskValue;
  String get riskLabel => _simulatorController.riskLabel;
  String get year => _simulatorController.year;

  ValorFuturo? get valorFuturo => _simulatorController.valorFuturo.value;
  ValorSimulado? get valorSimulado => _simulatorController.valorSimulado.value;

  double get balance => _simulatorController.balance;

  @override
  void initState() {
    super.initState();
    _simulatorController.valorSimulado.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    _simulatorController.valorFuturo.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    _init();
  }

  _init() async {
    await _simulatorController.fetchSimulator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppCustomColors.dark,
      ),
      backgroundColor: AppCustomColors.dark,
      body: ValueListenableBuilder<SimulatorState>(
        valueListenable: _simulatorController,
        builder: ((context, state, _) {
          if (state is SimulatorLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SimulatorErrorState) {
            return Center(
              child: TextButton(
                  onPressed: () {}, child: const Text('Tentar novamente')),
            );
          }
          if (state is SimulatorSucessState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(children: [
                      Text('Simule o seu futuro',
                          style: CustomAppTextTheme.largeCaption),
                      const SizedBox(height: 32, width: 32),
                      Text(
                          textAlign: TextAlign.center,
                          style: CustomAppTextTheme.label,
                          'Veja como podemos ajudar seu patrimônio a crescer muito mais.'),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nível de Risco: ',
                            style: CustomAppTextTheme.label,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            riskLabel,
                            style: CustomAppTextTheme.label
                                .copyWith(color: Colors.green.shade400),
                          ),
                        ],
                      ),
                      Center(
                        child: Slider(
                          divisions: 2,
                          max: 2.0,
                          min: 0.0,
                          activeColor: AppCustomColors.primary,
                          label: riskLabel,
                          value: riskValue,
                          onChanged: (double value) {
                            _simulatorController.changeRisk(value);
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Depósito Inicial: ',
                            style: CustomAppTextTheme.label,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'R\$ ${valorSimulado?.initialValue.round().toStringAsFixed(2)}',
                            style: CustomAppTextTheme.label
                                .copyWith(color: AppCustomColors.primary),
                          ),
                        ],
                      ),
                      Center(
                        child: Slider(
                            divisions: 5,
                            max: 2000,
                            min: 0.0,
                            semanticFormatterCallback: (double value) {
                              return '${value.round().toStringAsFixed(2)} reais';
                            },
                            activeColor: AppCustomColors.primary,
                            label:
                                valorSimulado?.initialValue.round().toString(),
                            value: valorSimulado?.initialValue ?? 0,
                            onChanged: (double value) {
                              _simulatorController.changeInitialValue;
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Depósito Mensal: ',
                            style: CustomAppTextTheme.label,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'R\$ ${valorSimulado?.mounthValue.round()}',
                            style: CustomAppTextTheme.label
                                .copyWith(color: Colors.green.shade400),
                          ),
                        ],
                      ),
                      Center(
                        child: Slider(
                            divisions: 5,
                            max: 200,
                            min: 0.0,
                            semanticFormatterCallback: (double value) {
                              return '${value.round()} reais';
                            },
                            activeColor: AppCustomColors.primary,
                            label: '${valorSimulado?.mounthValue.round()}',
                            value: valorSimulado?.mounthValue ?? 0,
                            onChanged: (double value) {
                              _simulatorController.changeMonthValue(value);
                            }),
                      ),
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.all(32),
                    color: AppCustomColors.foreGround,
                    child: Column(children: [
                      Text('Em $year, você terá:',
                          style: CustomAppTextTheme.blackCaption),
                      const SizedBox(height: 16),
                      Text('R\$ ${balance.toStringAsFixed(2)}',
                          style: CustomAppTextTheme.blackCaption
                              .copyWith(color: AppCustomColors.primary)),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Prazo:', style: CustomAppTextTheme.button),
                          const SizedBox(width: 8),
                          Text('Rendimento:', style: CustomAppTextTheme.button),
                          const SizedBox(width: 8),
                          Text('Taxa:', style: CustomAppTextTheme.button),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${valorSimulado?.month} meses',
                              style: CustomAppTextTheme.button),
                          valorFuturo == null
                              ? const Text('--')
                              : Text(
                                  'R\$ ${valorFuturo?.rendimentoTotal.toStringAsFixed(2)}',
                                  style: CustomAppTextTheme.button),
                          Text('${valorSimulado?.taxaAA.toStringAsFixed(2)} %',
                              style: CustomAppTextTheme.button),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text('Faça seu dinheiro render de verdade!',
                          style: CustomAppTextTheme.button),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () async {
                          await _simulatorController.addOrUpdateSimulator(
                            valorSimulado?.initialValue ?? 0,
                            valorSimulado?.mounthValue ?? 0,
                            valorSimulado!.month,
                            valorSimulado!.taxaAA,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Adicionar'),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20)
                    ]),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }
}
