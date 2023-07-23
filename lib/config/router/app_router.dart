import 'package:go_router/go_router.dart';
import 'package:trazabilidad/features/auth/auth.dart';
import 'package:trazabilidad/features/equipos/presentation/screens/screen.dart';
import 'package:trazabilidad/features/pantallacomunes/products.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    ///* Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    ///* Product Routes
    GoRoute(
      path: '/',
      builder: (context, state) => const ProductsScreen(),
    ),

    ///////////////////////////////EQUIPO///////////////
    GoRoute(
      path: '/equipo',
      name: EquipoScreen.name,
      builder: (context, state) => const EquipoScreen(),
      routes: [
        GoRoute(
          path: ':serial',
          name: EquipoInformacion.name,
          builder: (context, state) {
            final equipoSerial = state.params['serial'] ?? 'no-id';
            return EquipoInformacion(serial: equipoSerial);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/equiposcann',
      name: EquipoScann.name,
      builder: (context, state) => const EquipoScann(),
    ),
    GoRoute(
      path: '/manual',
      name: BusquedaManual.name,
      builder: (context, state) => const BusquedaManual(),
    ),
    GoRoute(
      path: '/movimiento',
      name: MovimientosEquipos.name,
      builder: (context, state) => const MovimientosEquipos(),
      routes: [
        GoRoute(
          path: ':serial',
          name: MovimientoEquipoScreen.name,
          builder: (context, state) {
            final movimientoSerial = state.params['serial'] ?? 'no-id';
            return MovimientoEquipoScreen(serial: movimientoSerial);
          },
        ),
      ],
    ),
    //////////////////////////////////////////////Mantencion/////////////////////////////////////////
    GoRoute(
      path: '/mantencion',
      name: MantencionesEquipos.name,
      builder: (context, state) => const MantencionesEquipos(),
      routes: [
        GoRoute(
          path: ':serial',
          name: MantencionEquipoScreen.name,
          builder: (context, state) {
            final mantencionSerial = state.params['serial'] ?? 'no-id';
            return MantencionEquipoScreen(serial: mantencionSerial);
          },
        ),
      ],
    ),
  ],
);
