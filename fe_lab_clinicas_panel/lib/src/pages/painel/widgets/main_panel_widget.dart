import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class MainPanelWidget extends StatelessWidget {
  const MainPanelWidget(
      {super.key,
      required this.passwordLabel,
      required this.password,
      required this.deskNumber,
      required this.labelColor,
      required this.buttonColor});
  final String passwordLabel;
  final String password;
  final String deskNumber;

  final Color labelColor;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: LabClinicasTheme.orangeColor,
            )),
        child: Column(
          children: [
            Text(
              passwordLabel,
              style: LabClinicasTheme.titleStyle
                  .copyWith(color: labelColor, fontSize: 36),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                  color: buttonColor, borderRadius: BorderRadius.circular(16)),
              child: Text(
                password,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Guichê',
              style: LabClinicasTheme.titleStyle
                  .copyWith(color: labelColor, fontSize: 36),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                  color: buttonColor, borderRadius: BorderRadius.circular(16)),
              child: Text(
                deskNumber,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
