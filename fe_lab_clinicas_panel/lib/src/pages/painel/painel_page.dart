import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_panel/src/pages/painel/widgets/main_panel_widget.dart';
import 'package:flutter/material.dart';

class PainelPage extends StatelessWidget {
  const PainelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .40,
                  child: MainPanelWidget(
                      passwordLabel: 'Senha anterior',
                      password: 'BG5DSAE',
                      deskNumber: '03',
                      labelColor: LabClinicasTheme.orangeColor,
                      buttonColor: LabClinicasTheme.blueColor),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .40,
                  child: MainPanelWidget(
                      passwordLabel: 'Chamando senha',
                      password: 'BG5DSAE',
                      deskNumber: '03',
                      labelColor: LabClinicasTheme.blueColor,
                      buttonColor: LabClinicasTheme.orangeColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
