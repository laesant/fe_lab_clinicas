import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
              width: sizeOf.width * .85,
              margin: const EdgeInsets.symmetric(vertical: 18),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: LabClinicasTheme.orangeColor),
              ),
              child: Column(
                children: [
                  Image.asset('assets/images/stroke_check.png'),
                  const SizedBox(height: 15),
                  const Text(
                    'Sua senha é',
                    style: LabClinicasTheme.titleSmallStyle,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    constraints:
                        const BoxConstraints(minWidth: 218, minHeight: 48),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                        color: LabClinicasTheme.orangeColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Text(
                      'BG5898',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text.rich(
                    TextSpan(text: 'AGUARDE!\n', children: [
                      TextSpan(text: 'Sua senha será chamada no painel')
                    ]),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: LabClinicasTheme.blueColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('IMPRIMIR SENHA')),
                      )),
                      const SizedBox(width: 16),
                      Expanded(
                          child: SizedBox(
                        height: 48,
                        child: OutlinedButton(
                            onPressed: () {},
                            child: const Text(
                              'ENVIAR SENHA VIA SMS',
                              textAlign: TextAlign.center,
                            )),
                      )),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                          backgroundColor: LabClinicasTheme.orangeColor),
                      onPressed: () {},
                      child: const Text(
                        'FINALIZAR',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
