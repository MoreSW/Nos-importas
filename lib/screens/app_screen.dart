import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nos_importas/screens/maps_screen.dart';
import 'package:nos_importas/screens/screen_controller.dart';
import 'package:nos_importas/screens/user_form_screen.dart';
import 'package:nos_importas/screens/button_emergency_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:nos_importas/screens/camera_function.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

enum options { A }

class _AppPageState extends State<AppPage> {
  //final _controller = ScreenController(Permission.locationAlways);
  //final _controller = ScreenController(Permission.locationWhenInUse);
  @override
  void initState() {
    super.initState();
    /*WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.checkPermission();
    });
    _controller.addListener(() {
      if (_controller.routeName != null) {
        Navigator.pushReplacementNamed(context, _controller.routeName!);
      }
    });*/
  }

  int currentPage = 1;
  final pageController = PageController(initialPage: 1);
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton(
          itemBuilder: (context) {
            return <PopupMenuEntry<options>>[
              new PopupMenuItem(
                  child: new Text("Here will come more options!")),
            ];
          },
        ),
        title: const Text("NOS IMPORTAS"),
        centerTitle: true,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              print(user.email!);
              print(user.displayName!);
              print(user.phoneNumber!);
              print(user.uid!);
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL!),
              child: GestureDetector(),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const UserForm(),
          const MapsPage(),
          const PanicPage(),
          Imagen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          currentPage = index;
          pageController.animateToPage(currentPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user_outlined),
            activeIcon: Icon(Icons.verified_user_rounded),
            label: "Usuarios de confianza",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            activeIcon: Icon(Icons.map_rounded),
            label: "Mapa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dangerous_outlined),
            activeIcon: Icon(Icons.dangerous_rounded),
            label: "Boton de panico",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            activeIcon: Icon(Icons.camera_alt_rounded),
            label: "Camara",
          ),
        ],
      ),
    );
  }
}
