import 'package:fitgame/src/theme/theme.dart';
import 'package:fitgame/src/widgets/custom_button.dart';
import 'package:fitgame/src/widgets/custom_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final textFormFieldEmail = TextEditingController();
  final textFormFieldPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyTheme.primaryColor,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          width: screenSize.width * 0.7,
                          image: const AssetImage("assets/logo.png"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomInputField(
                            label: 'Correo',
                            icon: const Icon(Icons.abc),
                            textEditingController: textFormFieldEmail),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomInputField(
                            label: 'Clave',
                            icon: const Icon(Icons.password),
                            obscure: true,
                            textEditingController: textFormFieldPwd),
                        CustomButton(
                          onPressed: () {},
                          button: 'Iniciar sesión',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("¿No tienes cuenta?"),
                            const SizedBox(
                              width: 6,
                            ),
                            CupertinoButton(
                              onPressed: () {
                                print("object");
                              },
                              padding: const EdgeInsets.all(0),
                              child: const Text(
                                "Registrate",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
