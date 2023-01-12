import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:non_stop_io/core/route_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Splash Screen'),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(RouteName.loginScreen);
            },
            child: const Text('Login'),
          ),
        ],
      ),
    ));
  }
}
