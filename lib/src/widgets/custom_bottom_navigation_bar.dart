import 'package:fitgame/src/providers/bottom_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    return BottomNavigationBar(
        currentIndex: bottomService.selectedIndex,
        onTap: (value) {
          bottomService.selectedIndex = value;
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'Historial reflejos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_history_sharp),
              label: 'Historial memoria'),
          BottomNavigationBarItem(
              icon: Icon(Icons.recent_actors_rounded),
              label: 'Records reflejos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.record_voice_over_sharp),
              label: 'Records memoria'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_circle_sharp), label: 'Perfil')
        ]);
  }
}
