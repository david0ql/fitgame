// To parse this JSON data, do
//
//     final memoriaResponse = memoriaResponseFromJson(jsonString);

import 'dart:convert';

List<MemoriaResponse> memoriaResponseFromJson(String str) => List<MemoriaResponse>.from(json.decode(str).map((x) => MemoriaResponse.fromJson(x)));

String memoriaResponseToJson(List<MemoriaResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MemoriaResponse {
    MemoriaResponse({
        required this.idMemoria,
        required this.tiempoSegundos,
        required this.calorias,
        required this.puntaje,
        required this.correo,
        required this.fechaCreacion,
        required this.numeroRepeticiones,
    });

    int idMemoria;
    String tiempoSegundos;
    String calorias;
    String puntaje;
    String correo;
    DateTime fechaCreacion;
    String numeroRepeticiones;

    factory MemoriaResponse.fromJson(Map<String, dynamic> json) => MemoriaResponse(
        idMemoria: json["id_memoria"],
        tiempoSegundos: json["tiempo_segundos"],
        calorias: json["calorias"],
        puntaje: json["puntaje"],
        correo: json["correo"],
        fechaCreacion: DateTime.parse(json["fecha_creacion"]),
        numeroRepeticiones: json["numero_repeticiones"],
    );

    Map<String, dynamic> toJson() => {
        "id_memoria": idMemoria,
        "tiempo_segundos": tiempoSegundos,
        "calorias": calorias,
        "puntaje": puntaje,
        "correo": correo,
        "fecha_creacion": fechaCreacion.toIso8601String(),
        "numero_repeticiones": numeroRepeticiones,
    };
}
