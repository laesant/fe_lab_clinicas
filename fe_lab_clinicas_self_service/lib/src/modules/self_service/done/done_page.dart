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
                    width: 218,
                    height: 48,
                    decoration: BoxDecoration(
                        color: LabClinicasTheme.orangeColor,
                        borderRadius: BorderRadius.circular(16)),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
