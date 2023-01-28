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
        const Text("Hola"),
        CustomButton(onPressed: () {}, button: "Cerrar sesion")
      ],
    ));
  }
}
