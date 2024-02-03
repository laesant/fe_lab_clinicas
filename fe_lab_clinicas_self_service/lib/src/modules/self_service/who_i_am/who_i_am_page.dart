import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validatorless/validatorless.dart';

class WhoIAmPage extends StatefulWidget {
  const WhoIAmPage({super.key});

  @override
  State<WhoIAmPage> createState() => _WhoIAmPageState();
}

class _WhoIAmPageState extends State<WhoIAmPage> {
  final selfServiceController = Injector.get<SelfServiceController>();
  final formKey = GlobalKey<FormState>();
  final firstNameEC = TextEditingController();
  final lastNameEC = TextEditingController();

  @override
  void dispose() {
    firstNameEC.dispose();
    lastNameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        firstNameEC.clear();
        lastNameEC.clear();
        selfServiceController.clearForm();
      },
      child: Scaffold(
        appBar: LabClinicasAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 64),
              child: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Finalizar Terminal'),
                  ),
                ],
                onSelected: (value) async {
                  if (value == 1) {
                    final nav = Navigator.of(context);
                    await SharedPreferences.getInstance()
                        .then((sp) => sp.clear());
                    nav.pushNamedAndRemoveUntil('/', (route) => false);
                  }
                },
                child: const IconPopupMenuWidget(),
              ),
            )
          ],
        ),
        body: LayoutBuilder(builder: (_, constrains) {
          var sizeOf = MediaQuery.sizeOf(context);
          return SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(minHeight: constrains.maxHeight),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background_login.png'),
                ),
              ),
              child: Container(
                width: sizeOf.width * .8,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Image.asset('assets/images/logo_vertical.png'),
                      const SizedBox(height: 48),
                      const Text(
                        'Bem-vindo!',
                        style: LabClinicasTheme.titleStyle,
                      ),
                      const SizedBox(height: 48),
                      TextFormField(
                        controller: firstNameEC,
                        validator: Validatorless.required('Nome obrigatório'),
                        decoration: const InputDecoration(
                            label: Text('Digite seu nome')),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: lastNameEC,
                        validator:
                            Validatorless.required('Sobrenome obrigatório'),
                        decoration: const InputDecoration(
                            label: Text('Digite seu sobrenome')),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: sizeOf.width * .8,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            final valid =
                                formKey.currentState?.validate() ?? false;
                            if (valid) {
                              selfServiceController.setWhoIAmDataStepAndNext(
                                  firstNameEC.text, lastNameEC.text);
                            }
                          },
                          child: const Text('CONTINUAR'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
