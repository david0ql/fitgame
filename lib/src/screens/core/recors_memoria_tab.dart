import 'package:fitgame/src/models/memoria_response.dart';
import 'package:fitgame/src/widgets/custom_card_memoria.dart';
import 'package:flutter/material.dart';
import 'package:fitgame/src/security/security_storage.dart';
import 'package:http/http.dart' as http;
class RecordMemoriaTab extends StatefulWidget {
  const RecordMemoriaTab({super.key});

  @override
  State<RecordMemoriaTab> createState() => _RecordMemoriaTabState();
}

class _RecordMemoriaTabState extends State<RecordMemoriaTab> {
  int cantidad = 0;
  late List<MemoriaResponse> historialResponseData;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: historialResponse(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: cantidad,
          itemBuilder: (BuildContext context, int index) {
            return CustomCardMemoria(
                tiempoSegundos: historialResponseData[index].tiempoSegundos,
                calorias: historialResponseData[index].calorias,
                puntaje: historialResponseData[index].puntaje,
                numeroRepeticiones:
                    historialResponseData[index].numeroRepeticiones,
                fechaCreacion:
                    historialResponseData[index].fechaCreacion.toString());
          },
        );
      },
    );
  }

  Future<List<MemoriaResponse>> historialResponse() async {
    final String correo = await SecurityStorage.read("email");
    final httpRequest = await http.get(
        Uri.https('fitgame.ga', '/records/memoria'));
    final cantidadHistorial = memoriaResponseFromJson(httpRequest.body);
    cantidad = cantidadHistorial.length;
    historialResponseData = cantidadHistorial;
    return cantidadHistorial;
  }
}
