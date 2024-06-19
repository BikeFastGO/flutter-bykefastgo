import 'package:bykefastgo/presentation/providers/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:bykefastgo/shared/shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends ConsumerState<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final textStyles = Theme.of(context).textTheme;

    return NavigationDrawer(
        elevation: 1,
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
          final router = GoRouter.of(context);
          if (value == 0) {
            router.push('/');
          } else if (value == 1) {
            router.push('/profile');
          } else if (value == 2) {
            router.push('/map');
          } else if (value == 3) {
            router.push('/favorite');
          }
          // final menuItem = appMenuItems[value];
          // context.push( menuItem.link );
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, hasNotch ? 10 : 30, 16, 10),
            child: Image.asset('assets/images/logo.png',
                height: 60), // Asume que tienes un logo en tus assets
          ),
          const SizedBox(height: 30),
          const NavigationDrawerDestination(
            icon: Icon(Icons.home_outlined),
            label: Text('Inicio'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.person_outline),
            label: Text('Mi cuenta'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.location_on_outlined),
            label: Text('Mapas'),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.favorite_border),
            label: Text('Favoritos'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.add_circle_outline),
            label: Text('Publicar'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons
                .calendar_today_outlined), // Icono que representa las reservas
            label: Text('Administrar Reservas'),
          ),
          //Padding(
          //  padding: const EdgeInsets.symmetric(horizontal: 20),
          //  child: CustomFilledButton(
          //      onPressed: () {
          //        ref.read(authProvider.notifier).logOut();
          //      },
          //      text: 'Cerrar sesión'),
          //),
        ]);
  }
}
