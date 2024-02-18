import 'package:fe_lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/patient_information_form/patient_information_form_repository.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CheckinController with MessageStateMixin {
  CheckinController({
    required PatientInformationFormRepository patientInformationFormRepository,
  }) : _patientInformationFormRepository = patientInformationFormRepository;

  final patientInformationForm = signal<PatientInformationFormModel?>(null);
  final endProcess = signal(false);
  final PatientInformationFormRepository _patientInformationFormRepository;

  Future<void> endCheckin() async {
    if (patientInformationForm() != null) {
      final result = await _patientInformationFormRepository.updateStatus(
          patientInformationForm.value!.id,
          PatientInformationFormStatus.beingAttended);
      switch (result) {
        case Left():
          showError('Erro ao atualizar o status do formulário');
        case Right():
          endProcess.value = true;
      }
    } else {
      showError('Formulário não pode ser nulo');
    }
  }
}
