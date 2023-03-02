import 'package:fitgame/src/security/security_storage.dart';
import 'package:fitgame/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PerfilTab extends StatelessWidget {
  const PerfilTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
            onPressed: () async {
              await SecurityStorage.deleteAll();
              Navigator.pushReplacementNamed(context, 'login');
            },
            button: "Cerrar sesion")
      ],
    ));
  }
}
