import 'package:bykefastgo/presentation/providers/providers.dart';
import 'package:bykefastgo/presentation/screens/screens.dart';
import 'package:bykefastgo/presentation/widgets/widgets.dart';
import 'package:bykefastgo/shared/util/shared_entities/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../shared/widgets/widgets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  Position? currentPosition;
  final TextEditingController _searchController = TextEditingController();
  Future<void> _checkLocationPermission() async {
    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) => {currentPosition = position})
          .catchError((e) {
        debugPrint(e);
      });
      setUserPosition(currentPosition!.latitude, currentPosition!.longitude);
      // Location permissions are granted, proceed with creating the map.
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    bool searching = false;

    return Scaffold(
        drawer: SideMenu(scaffoldKey: scaffoldKey),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: BicycleSearchDelegate());
                },
                icon: Icon(Icons.search_rounded)),
            IconButton(
                onPressed: () {
                  context.push('/shopping-cart');
                },
                icon: const Icon(Icons.shopping_cart)),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await ref.read(bicyclesProvider.notifier).getBicycles();
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AdvertisementCards(),
              ),
              const BicyclesScreen(),
            ],
          ),
        ));
  }
}
