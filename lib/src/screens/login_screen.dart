// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:fitgame/src/security/security_storage.dart';
import 'package:fitgame/src/theme/theme.dart';
import 'package:fitgame/src/widgets/custom_button.dart';
import 'package:fitgame/src/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
                          onPressed: () async {
                            await login(
                                textFormFieldEmail.text, textFormFieldPwd.text);
                          },
                          button: 'Iniciar sesión',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Future<void> login(String usuario, String clave) async {
    final headers = {'Content-Type': 'application/json'};
    Map<String, String> body = {
      "usuario": usuario,
      "clave": clave,
    };
    String jsonBody = json.encode(body);
    final httpRequest = await http.post(
      Uri.https('fitgame.ga', '/login'),
      body: jsonBody,
      headers: headers,
    );

    final data = jsonDecode(httpRequest.body);

    if (data.length.toString() == "1") {
      await SecurityStorage.write("email", data[0]["correo"].toString());
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Revisa tus credenciales"),
        ),
      );
    }
  }
}
