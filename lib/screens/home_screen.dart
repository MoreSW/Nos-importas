import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nos_importas/screens/app_screen.dart';
import 'package:nos_importas/screens/screen_redirect.dart';
import 'package:nos_importas/screens/sign_up_screen.dart';
import '../widget/login_handler.dart';
import '../widget/sign_up_widget.dart';
import 'package:nos_importas/screens/camera_function.dart';
import 'package:nos_importas/screens/send_mail.dart';

import 'button_emergency_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              print(snapshot.data);
              return const AppPage();
            } else if (snapshot.hasError) {
              return const Center(child: Text('Hubo un error!'));
            } else {
              return const SignUpPage();
            }
          },
        ),
      );
}
