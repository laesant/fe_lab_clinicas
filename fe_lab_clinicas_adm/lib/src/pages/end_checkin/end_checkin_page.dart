import 'package:fe_lab_clinicas_adm/src/pages/end_checkin/end_checkin_controller.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';

class EndCheckinPage extends StatefulWidget {
  const EndCheckinPage({super.key});

  @override
  State<EndCheckinPage> createState() => _EndCheckinPageState();
}

class _EndCheckinPageState extends State<EndCheckinPage> with MessageViewMixin {
  final controller = Injector.get<EndCheckinController>();

  @override
  void initState() {
    messageListener(controller);

    effect(() {
      if (controller.informationForm() != null) {
        Navigator.of(context).pushReplacementNamed('/pre-checkin',
            arguments: controller.informationForm());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: sizeOf.width * .4,
          margin: const EdgeInsets.symmetric(vertical: 56),
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/check_icon.png'),
              const SizedBox(height: 40),
              const Text(
                'Atendimento finalizado com sucesso',
                style: LabClinicasTheme.subTitleSmallStyle,
              ),
              const SizedBox(height: 80),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48)),
                  onPressed: () {
                    controller.callNextPatient();
                  },
                  child: const Text('CHAMAR OUTRA SENHA'))
            ],
          ),
        ),
      ),
    );
  }
}
