import 'dart:convert';

List<HistorialResponse> historialResponseFromJson(String str) =>
    List<HistorialResponse>.from(
        json.decode(str).map((x) => HistorialResponse.fromJson(x)));

String historialResponseToJson(List<HistorialResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistorialResponse {
  HistorialResponse({
    required this.idReflejo,
    required this.tiempoSegundos,
    required this.calorias,
    required this.puntaje,
    required this.correo,
    required this.numeroPulsaciones,
    required this.fechaCreacion,
    this.numeroAciertos,
  });

  int idReflejo;
  String tiempoSegundos;
  String calorias;
  String puntaje;
  String correo;
  String numeroPulsaciones;
  DateTime fechaCreacion;
  dynamic numeroAciertos;

  factory HistorialResponse.fromJson(Map<String, dynamic> json) =>
      HistorialResponse(
        idReflejo: json["id_reflejo"],
        tiempoSegundos: json["tiempo_segundos"],
        calorias: json["calorias"],
        puntaje: json["puntaje"],
        correo: json["correo"],
        numeroPulsaciones: json["numero_pulsaciones"],
        fechaCreacion: DateTime.parse(json["fecha_creacion"]),
        numeroAciertos: json["numero_aciertos"],
      );

  Map<String, dynamic> toJson() => {
        "id_reflejo": idReflejo,
        "tiempo_segundos": tiempoSegundos,
        "calorias": calorias,
        "puntaje": puntaje,
        "correo": correo,
        "numero_pulsaciones": numeroPulsaciones,
        "fecha_creacion": fechaCreacion.toIso8601String(),
        "numero_aciertos": numeroAciertos,
      };
}
