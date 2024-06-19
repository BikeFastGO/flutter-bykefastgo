import 'package:bykefastgo/presentation/providers/auth/auth_provider.dart';
import 'package:bykefastgo/presentation/providers/user/user_provider.dart';
import 'package:bykefastgo/shared/widgets/loading_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter/material.dart';

import '../screens.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends ConsumerState {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    ref.read(userProvider.notifier).getUserById();
    loadUser();
  }

  Future<void> loadUser() async {
    try {
      await ref.read(userProvider.notifier).getUserById();
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider);
    final user = userState.user;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(LineAwesomeIcons.angle_left_solid)),
        title: const Text('Mi cuenta'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Theme.of(context).brightness == Brightness.dark
                  ? LineAwesomeIcons.sun
                  : LineAwesomeIcons.moon))
        ],
        elevation: 0, // Remove the shadow
      ),
      body: isLoading ? LoadingScreen() : 
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('${user?.imageData}'),
              ),
              const SizedBox(height: 10),
              Text('${user?.userFirstName} ${user?.userLastName}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium),

              Text('${user?.userEmail}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.go('/profile-edit');
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                child: const Text('Editar perfil'),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              ///Menu
              ProfileMenuWidget(
                title: "Bicicletas publicadas",
                icon: LineAwesomeIcons.bicycle_solid,
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PublishedBicyclesScreen()));
                },
              ),
              ProfileMenuWidget(
                title: "Administración de cuenta",
                icon: LineAwesomeIcons.user_check_solid,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Detalles de pago",
                icon: LineAwesomeIcons.wallet_solid,
                onPress: () {
                  context.go('/payment-details');
                },
              ),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "Cerrar sesión",
                icon: LineAwesomeIcons.sign_out_alt_solid,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  ref.read(authProvider.notifier).logOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends ConsumerStatefulWidget {
  const ProfileMenuWidget({
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
    super.key,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  ConsumerState<ProfileMenuWidget> createState() => _ProfileMenuWidgetState();
}

class _ProfileMenuWidgetState extends ConsumerState<ProfileMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onPress,
      leading: CircleAvatar(
        backgroundColor: Colors.tealAccent.withOpacity(0.1),
        child: Icon(widget.icon, color: Colors.blueAccent),
      ),
      title: Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: widget.textColor),
      ),
      trailing: widget.endIcon
          ? const Icon(LineAwesomeIcons.angle_right_solid, color: Colors.grey)
          : null,
    );
  }
}
