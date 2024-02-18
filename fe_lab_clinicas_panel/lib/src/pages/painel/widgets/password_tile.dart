import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class PasswordTile extends StatelessWidget {
  const PasswordTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: LabClinicasTheme.orangeColor),
      ),
      child: const Column(
        children: [
          Text(
            'OF0009W',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: LabClinicasTheme.blueColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Guichê 03',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: LabClinicasTheme.orangeColor,
            ),
          )
        ],
      ),
    );
  }
}
