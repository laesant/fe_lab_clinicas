import 'package:fe_lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/src/pages/checkin/checkin_controller.dart';
import 'package:fe_lab_clinicas_adm/src/pages/checkin/checkin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_getit/flutter_getit.dart';

class CheckinRouter extends FlutterGetItPageRouter {
  const CheckinRouter({super.key});

  @override
  List<Bind<Object>> get bindings =>
      [Bind.lazySingleton((i) => CheckinController())];

  @override
  String get routeName => '/checkin';

  @override
  WidgetBuilder get view => (context) {
        final form = ModalRoute.of(context)!.settings.arguments
            as PatientInformationFormModel;
        context.get<CheckinController>().patientInformationForm.value = form;
        return const CheckinPage();
      };
}
