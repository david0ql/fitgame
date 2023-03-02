import 'package:fitgame/src/models/historial_response.dart';
import 'package:fitgame/src/security/security_storage.dart';
import 'package:fitgame/src/widgets/custom_card_historial.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecordReflejosTab extends StatefulWidget {
  const RecordReflejosTab({super.key});

  @override
  State<RecordReflejosTab> createState() => _RecordReflejosTabState();
}

class _RecordReflejosTabState extends State<RecordReflejosTab> {
  int cantidad = 0;
  late List<HistorialResponse> historialResponseData;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: historialResponse(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: cantidad,
          itemBuilder: (BuildContext context, int index) {
            return CustomCardHistorial(
                tiempoSegundos: historialResponseData[index].tiempoSegundos,
                calorias: historialResponseData[index].calorias,
                puntaje: historialResponseData[index].puntaje,
                numeroPulsaciones:
                    historialResponseData[index].numeroPulsaciones,
                fechaCreacion:
                    historialResponseData[index].fechaCreacion.toString());
          },
        );
      },
    );
  }

  Future<List<HistorialResponse>> historialResponse() async {
    final String correo = await SecurityStorage.read("email");
    final httpRequest = await http.get(
        Uri.https('fitgame.ga', '/records/reflejos'));
    final cantidadHistorial = historialResponseFromJson(httpRequest.body);
    cantidad = cantidadHistorial.length;
    historialResponseData = cantidadHistorial;
    return cantidadHistorial;
  }
}
