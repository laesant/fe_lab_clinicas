import 'package:flutter/material.dart';

class LabClinicasAppBar extends AppBar {
  LabClinicasAppBar({super.key, List<Widget>? actions})
      : super(
            toolbarHeight: 72,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 64),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 1),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Image.asset('assets/images/logo_horizontal.png'),
            ),
            actions: actions);
}
