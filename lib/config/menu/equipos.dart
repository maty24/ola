import 'package:flutter/material.dart';

class EquipoItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const EquipoItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appEquipoItems = <EquipoItem>[
  EquipoItem(
    title: 'Scan qr',
    subTitle: 'Escanear codigo qr',
    link: '/equiposcann',
    icon: Icons.qr_code_scanner,
  ),
  EquipoItem(
    title: 'Manual',
    subTitle: 'Buscar por codigo de serie',
    link: '/manual',
    icon: Icons.smart_button_outlined,
  ),
  EquipoItem(
    title: 'Movimentos',
    subTitle: 'Ver todos los movimientos',
    link: '/manual',
    icon: Icons.sync_alt_outlined,
  ),
  EquipoItem(
    title: 'Mantenciones',
    subTitle: 'Ver todas las mantenciones',
    link: '/manual',
    icon: Icons.engineering,
  ),
];
