import 'package:brasil_fields/brasil_fields.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/self_service_model.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_form_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/widget/lab_clinicas_self_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage>
    with PatientFormController, MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  final selfServiceController = Injector.get<SelfServiceController>();
  final patientController = Injector.get<PatientController>();
  late bool patientFound;
  late bool enableForm;

  @override
  void initState() {
    messageListener(patientController);
    final SelfServiceModel(:patient) = selfServiceController.model;

    patientFound = patient != null;
    enableForm = !patientFound;
    initializeForm(patient);

    effect(() {
      if (patientController.nextStep) {
        selfServiceController
            .updatePatientAndGoDocument(patientController.patient);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    disposeForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasSelfServiceAppBar(),
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Visibility(
                      visible: patientFound,
                      replacement: Image.asset('assets/images/lupa_icon.png'),
                      child: Image.asset('assets/images/check_icon.png')),
                  const SizedBox(height: 24),
                  Text(
                    'Cadastro${patientFound ? ' ' : ' não '}Encontrado',
                    style: LabClinicasTheme.titleSmallStyle,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    patientFound
                        ? 'Confirma os dados do seu cadastro'
                        : 'Preencha o formulário abaixo para fazer o seu cadastro',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: LabClinicasTheme.blueColor),
                  ),
                  const SizedBox(height: 28),
                  TextFormField(
                    readOnly: !enableForm,
                    controller: nameEC,
                    validator: Validatorless.required('Campo obrigatório'),
                    decoration: const InputDecoration(
                        label: InputLabel(text: 'Nome do Paciente')),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    readOnly: !enableForm,
                    controller: emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.email('Email inválido'),
                    ]),
                    decoration: const InputDecoration(
                        label: InputLabel(text: 'E-mail')),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    readOnly: !enableForm,
                    controller: phoneEC,
                    validator: Validatorless.required('Campo obrigatório'),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter()
                    ],
                    decoration: const InputDecoration(
                        label: InputLabel(text: 'Telefone de Contato')),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    readOnly: !enableForm,
                    controller: documentEC,
                    validator: Validatorless.required('Campo obrigatório'),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter()
                    ],
                    decoration: const InputDecoration(
                        label: InputLabel(text: 'Digite seu CPF')),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    readOnly: !enableForm,
                    controller: cepEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter()
                    ],
                    validator: Validatorless.required('Campo obrigatório'),
                    decoration:
                        const InputDecoration(label: InputLabel(text: 'CEP')),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          readOnly: !enableForm,
                          controller: streetEC,
                          validator:
                              Validatorless.required('Campo obrigatório'),
                          decoration: const InputDecoration(
                              label: InputLabel(text: 'Endereço')),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          readOnly: !enableForm,
                          controller: numberEC,
                          validator:
                              Validatorless.required('Campo obrigatório'),
                          decoration: const InputDecoration(
                              label: InputLabel(text: 'Número')),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          readOnly: !enableForm,
                          controller: complementEC,
                          decoration: const InputDecoration(
                              label: InputLabel(text: 'Complemento')),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          readOnly: !enableForm,
                          controller: stateEC,
                          validator:
                              Validatorless.required('Campo obrigatório'),
                          decoration: const InputDecoration(
                              label: InputLabel(text: 'Estado')),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          readOnly: !enableForm,
                          controller: cityEC,
                          validator:
                              Validatorless.required('Campo obrigatório'),
                          decoration: const InputDecoration(
                              label: InputLabel(text: 'Cidade')),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          readOnly: !enableForm,
                          controller: districtEC,
                          validator:
                              Validatorless.required('Campo obrigatório'),
                          decoration: const InputDecoration(
                              label: InputLabel(text: 'Bairro')),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    readOnly: !enableForm,
                    controller: guardianEC,
                    decoration: const InputDecoration(
                        label: InputLabel(text: 'Responsável')),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    readOnly: !enableForm,
                    controller: guardianIdentificationNumberEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter()
                    ],
                    decoration: const InputDecoration(
                        label: InputLabel(text: 'Responsável identificação')),
                  ),
                  const SizedBox(height: 32),
                  Visibility(
                    visible: !enableForm,
                    replacement: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          final isValid =
                              formKey.currentState?.validate() ?? false;
                          if (isValid) {
                            if (patientFound) {
                              patientController.updateAndNext(updatePatient(
                                  selfServiceController.model.patient!));
                            } else {
                              patientController
                                  .saveAndNext(createPatientRegister());
                            }
                          }
                        },
                        child: Visibility(
                          visible: !patientFound,
                          replacement: const Text('SALVAR E CONTINUAR'),
                          child: const Text('CADASTRAR'),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  enableForm = true;
                                });
                              },
                              child: const Text('EDITAR'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 17),
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                patientController.patient =
                                    selfServiceController.model.patient;
                                patientController.goNextStep();
                              },
                              child: const Text('CONTINUAR'),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
