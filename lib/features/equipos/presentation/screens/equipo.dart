import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trazabilidad/config/menu/equipos.dart';

class EquipoScreen extends StatelessWidget {
  static const name = 'equipo-screen';
  const EquipoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Acciones equipos'),
      ),
      body: const _HomeEquipo(),
    );
  }
}

class _HomeEquipo extends StatelessWidget {
  const _HomeEquipo();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appEquipoItems.length,
      itemBuilder: (context, index) {
        final menuItem = appEquipoItems[index];
        return _CustomListTite(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTite extends StatelessWidget {
  const _CustomListTite({
    required this.menuItem,
  });

  //este es el array de los items
  final EquipoItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(menuItem.icon),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        color: colors.primary,
      ),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        //estoy haciendo el push de las rutas o screens
        context.push(menuItem.link);
      },
    );
  }
}
