import 'package:fe_lab_clinicas_adm/src/shared/data_item.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PreCheckinPage extends StatelessWidget {
  const PreCheckinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.sizeOf(context).width * .5,
            margin: const EdgeInsets.only(top: 56),
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: LabClinicasTheme.orangeColor,
              ),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/patient_avatar.png'),
                const SizedBox(height: 16),
                const Text(
                  'A senha chamada foi',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(height: 16),
                Container(
                  width: 218,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                    color: LabClinicasTheme.orangeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Laenio Marques',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                DataItem(
                  label: 'Nome Paciente',
                  value: 'Laenio Marques',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Email',
                  value: 'Laenio Marques',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Telefone de contato',
                  value: 'Laenio Marques',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'CPF',
                  value: 'Laenio Marques',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'CEP',
                  value: 'Laenio Marques',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Endereço',
                  value: 'Laenio Marques',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Responsável',
                  value: 'Laenio Marques',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Documento de Identificação',
                  value: 'Laenio Marques',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size.fromHeight(48)),
                          onPressed: () {},
                          child: Text('CHAMAR OUTRA SENHA')),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size.fromHeight(48)),
                            onPressed: () {},
                            child: Text('ATENDER')))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
