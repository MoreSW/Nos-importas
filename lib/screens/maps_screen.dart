import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/*import 'package:nos_importas/functions/input_file.dart';
import 'package:nos_importas/screens/app_screen.dart';*/

import 'package:nos_importas/screens/maps_controller.dart';
import 'package:provider/provider.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);
/*
  @override
  _MapsPageState createState() => _MapsPageState();*/
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MapsController>(
        create: (_) {
          final controller = MapsController();
          return controller;
        },
        child: Scaffold(
          body: Selector<MapsController, bool>(
              selector: (_, controller) => controller.loading,
              builder: (context, loading, child) {
                return Consumer<MapsController>(builder: (_, controller, __) {
                  if (!controller.gpsEnabled) {
                    return Center(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        const Text("Tu gps estaapagado"),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Prender gps",
                              textAlign: TextAlign.center,
                            ))
                      ]),
                    );
                  }
                  final initialCameraPosition = CameraPosition(
                    target: LatLng(
                      controller.initialPosition!.latitude,
                      controller.initialPosition!.longitude,
                    ),
                    zoom: 15,
                  );
                  return GoogleMap(
                    markers: controller.markers,
                    polylines: controller.polylines,
                    //onMapCreated: _controller.onMapCreated,
                    initialCameraPosition: initialCameraPosition,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    //onTap: (position) { print(position); },
                    onTap: controller.onTap,
                  );
                });
              }),
        ));
  }
}
/*
class _MapsPageState extends State<MapsPage> {
  final _controller = MapsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Selector<MapsController, bool>(
        selector: (_, controller) => _controller.loading,
      ),
    );
  }
}
/*
body: GoogleMap(
        //markers: _controller.markers,
        //onMapCreated: _controller.onMapCreated,
        initialCameraPosition: _controller.initialCameraPosition,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        //onTap: (position) { print(position); },
        //onTap: _controller.onTap,
      ),*/*/