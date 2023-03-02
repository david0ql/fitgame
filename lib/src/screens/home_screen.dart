// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:fitgame/src/providers/bottom_service.dart';
import 'package:fitgame/src/screens/core/historial_memoria_tab.dart';
import 'package:fitgame/src/screens/core/historial_reflejos_tab.dart';
import 'package:fitgame/src/screens/core/perfil_tab.dart';
import 'package:fitgame/src/screens/core/records_reflejos_tab.dart';
import 'package:fitgame/src/screens/core/recors_memoria_tab.dart';
import 'package:fitgame/src/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../security/security_storage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "FitGame",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: const HomeSwitch(),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                  "#ff6666", "Cancel", true, ScanMode.QR);
              await updateScore(barcodeScanRes);
              Navigator.pushReplacementNamed(context, 'splash');
            },
            elevation: 3,
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: const CustomBottomNavigationBar()),
    );
  }

  Future<void> updateScore(String code) async {
    final String correo = await SecurityStorage.read("email");
    final headers = {'Content-Type': 'application/json'};
    Map<String, String> body = {"correo": correo, "id_reflejo": code};
    Map<String, String> body2 = {"correo": correo, "id_memoria": code};
    String jsonBody = json.encode(body);
    String jsonBody2 = json.encode(body2);
    await http.post(
      Uri.https('fitgame.ga', '/setscore/score'),
      body: jsonBody,
      headers: headers,
    );
        await http.post(
      Uri.https('fitgame.ga', '/setscore/score2'),
      body: jsonBody2,
      headers: headers,
    );
  }
}

class HomeSwitch extends StatelessWidget {
  const HomeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    switch (bottomService.selectedIndex) {
      case 0:
        return const ReflejosTab();
      case 1:
        return const MemoriaTab();
      case 2:
        return const RecordReflejosTab();
      case 3:
        return const RecordMemoriaTab();
      case 4:
        return const PerfilTab();
      default:
        return const ReflejosTab();
    }
  }
}
