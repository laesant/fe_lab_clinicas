import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_panel/src/pages/painel/widgets/main_panel_widget.dart';
import 'package:fe_lab_clinicas_panel/src/pages/painel/widgets/password_tile.dart';
import 'package:flutter/material.dart';

class PainelPage extends StatelessWidget {
  const PainelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .40,
                  child: const MainPanelWidget(
                      passwordLabel: 'Senha anterior',
                      password: 'BG5DSAE',
                      deskNumber: '03',
                      labelColor: LabClinicasTheme.orangeColor,
                      buttonColor: LabClinicasTheme.blueColor),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .40,
                  child: const MainPanelWidget(
                      passwordLabel: 'Chamando senha',
                      password: 'BG5DSAE',
                      deskNumber: '03',
                      labelColor: LabClinicasTheme.blueColor,
                      buttonColor: LabClinicasTheme.orangeColor),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Divider(
              color: LabClinicasTheme.orangeColor,
            ),
            const SizedBox(height: 30),
            const Text(
              'Últimos chamados',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: LabClinicasTheme.orangeColor,
              ),
            ),
            const SizedBox(height: 16),
            const Wrap(
              runAlignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
                PasswordTile(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
