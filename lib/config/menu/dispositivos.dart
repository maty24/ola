import 'package:flutter/material.dart';

class DispositivoItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const DispositivoItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appDispositivosItem = <DispositivoItem>[
  DispositivoItem(
    title: 'Scan qr',
    subTitle: 'Escanear codigo qr',
    link: '/dispositivoscann',
    icon: Icons.qr_code_scanner,
  ),
  DispositivoItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  )
];
