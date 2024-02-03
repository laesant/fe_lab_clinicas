import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasAppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 64),
            child: PopupMenuButton<int>(
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                    value: 1, child: Text('Iniciar Terminal')),
                const PopupMenuItem<int>(
                    value: 2, child: Text('Finalizar Terminal'))
              ],
              child: const IconPopupMenuWidget(),
            ),
          )
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: sizeOf.width * .8,
          padding: const EdgeInsets.all(40),
          margin: const EdgeInsets.only(top: 112),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: LabClinicasTheme.orangeColor),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Bem Vindo!', style: LabClinicasTheme.titleStyle),
              const SizedBox(height: 32),
              SizedBox(
                  width: sizeOf.width * .8,
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/self-service');
                      },
                      child: const Text('INICIAR TERMINAL')))
            ],
          ),
        ),
      ),
    );
  }
}
