import 'package:fitgame/src/providers/bottom_service.dart';
import 'package:fitgame/src/screens/core/historial_memoria_tab.dart';
import 'package:fitgame/src/screens/core/historial_reflejos_tab.dart';
import 'package:fitgame/src/screens/core/perfil_tab.dart';
import 'package:fitgame/src/screens/core/records_tab.dart';
import 'package:fitgame/src/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
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
                  "#ff6666", "Cancel", false, ScanMode.QR);
            },
            elevation: 3,
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: const CustomBottomNavigationBar()),
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
        return const RecordTab();
      case 3:
        return const PerfilTab();
      default:
        return const ReflejosTab();
    }
  }
}
