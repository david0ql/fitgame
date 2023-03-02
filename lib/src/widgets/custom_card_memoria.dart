import 'package:flutter/material.dart';

class CustomCardMemoria extends StatelessWidget {
  final String tiempoSegundos;
  final String calorias;
  final String puntaje;
  final String numeroRepeticiones;
  final String fechaCreacion;
  const CustomCardMemoria(
      {super.key,
      required this.tiempoSegundos,
      required this.calorias,
      required this.puntaje,
      required this.numeroRepeticiones,
      required this.fechaCreacion});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Card(
        elevation: 6,
        child: Container(
          margin: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Tiempo: $tiempoSegundos',
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
            Text('Calorias: $calorias',
                style: const TextStyle(fontWeight: FontWeight.w300)),
            Text('Puntaje: $puntaje',
                style: const TextStyle(fontWeight: FontWeight.w300)),
            Text('Numero de pulsaciones: $numeroRepeticiones',
                style: const TextStyle(fontWeight: FontWeight.w300)),
            Text('Fecha: $fechaCreacion',
                style: const TextStyle(fontWeight: FontWeight.w300)),
          ]),
        ),
      ),
    );
  }
}
