import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Equipos medicos',
      subTitle: 'Acciones equipos medicos',
      link: '/equipo',
      icon: Icons.medical_services),
  MenuItem(
      title: 'Dispositivos medicos',
      subTitle: 'Acciones dispositivos medicos',
      link: '/dispositivo',
      icon: Icons.medical_information),
];
