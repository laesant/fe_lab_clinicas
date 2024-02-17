import 'package:fe_lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CheckinController with MessageStateMixin {
  final patientInformationForm = signal<PatientInformationFormModel?>(null);
}
